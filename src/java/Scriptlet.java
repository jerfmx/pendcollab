import com.google.zxing.qrcode.QRCodeWriter;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.common.ByteMatrix;
import com.google.zxing.WriterException;

import java.awt.Color;
import java.awt.image.BufferedImage;
import java.awt.Graphics2D;
import java.awt.image.renderable.ParameterBlock;
import java.awt.Rectangle;
import java.awt.image.AffineTransformOp;
import java.awt.geom.AffineTransform;

import javax.media.jai.JAI;
import javax.media.jai.PlanarImage;

import net.sf.jasperreports.engine.JRDefaultScriptlet;
import net.sf.jasperreports.engine.JRScriptletException;

import org.krysalis.barcode4j.impl.code128.Code128Bean;
import org.krysalis.barcode4j.output.bitmap.BitmapCanvasProvider;
import org.krysalis.barcode4j.tools.UnitConv;

public class Scriptlet extends JRDefaultScriptlet{

	QRCodeWriter qrcodeWriter = new QRCodeWriter();
	BarcodeFormat format = BarcodeFormat.QR_CODE;

	String blockColor = "#000000";
	String backgroundColor = "#FFFFFF";

	public BufferedImage generateBarcode1(String v) throws JRScriptletException{
		String value = v;
		//System.out.println("v: "+v);
		BufferedImage barcodeImg = null;
		Code128Bean bean = new Code128Bean();
		final int dpi = 300;
		bean.setModuleWidth(UnitConv.in2mm(1f/dpi));
		bean.doQuietZone(true);
		bean.setFontSize(0.9);
		bean.setBarHeight(3);
		bean.doQuietZone(false);
		try {
			//System.out.println("generando imagen barcode...");
			BitmapCanvasProvider provider = new BitmapCanvasProvider(dpi, BufferedImage.TYPE_BYTE_GRAY, true, 0);
			bean.generateBarcode(provider, value);
			provider.finish();
			barcodeImg = provider.getBufferedImage();
		} catch (Exception e) {
		}
		return barcodeImg;
	}

	/**
	* Determines the size of the data matrix we will need
	* by reading the size of the string and calculating what
	* the square root of that size is. This is the minimum
	* width in pixels we can create a QRCode in.
	*
	* NOTE: this does not mean the <b>image</b> is that size.
	* You will have to scale the image up or down to fit.
	*/
	int calculateMatrixSize(String data) {
		int length = data.length();
		double sqr = Math.sqrt(length);
		int size = (int)Math.round(sqr + 0.5);
		return size;
		}


   /*
    * Draws a simple block (not useful outside this class
    */
	private void drawBlock(Graphics2D graphics, Color color, int x, int y, int w, int h) {
		Rectangle block = new Rectangle(w, h);
		block.setLocation(x, y);
		graphics.setColor(color);
		graphics.draw(block);
		graphics.fill(block);
		}

	/**
	* Creates a 1 pixel = 1 block QRCode image containing the data you specify.
	*/
	java.awt.image.RenderedImage render(String data) {
		long size = calculateMatrixSize(data);
		return render(data, size);
		}

	java.awt.image.RenderedImage render(String data, Long width) {
		return render(data, width, width);
		}

	java.awt.image.RenderedImage render(String data, Long width, Long height) {
		return render(data, width.intValue(), height.intValue());
		}

	/**
	* Renders a String inside a QRCode in a RenderedImage object of the width and
	* height you specify. The result CANNOT be smaller than one pixel per byte.
	* That means if your data takes 30 bytes and you ask for a 16x16 image the
	* renderer will ignore your scale requests and simply report the smallest image
	* it possibly can.
	*
	* Choose square width and height please.
	*/
	java.awt.image.RenderedImage render(String data, int width, int height) {
		PlanarImage renderedImage=null;
		try{
			// first we render the matrix completely unscaled. One pixel per byte.
			int size = calculateMatrixSize(data);
			ByteMatrix matrix = qrcodeWriter.encode(data, format, size, size);
			// NEVER allow the user to request an image smaller than the minimum pixels
			// needed to render one bit per pixel from our byte matrix.
			double scaleX = width/matrix.getWidth();
			if(scaleX < 1.0d) { scaleX = 1.0d; }
			double scaleY = height/matrix.getHeight();
			if(scaleY < 1.0d) { scaleY = 1.0d; }

			String backgroundCode = "0x"+backgroundColor.replace("#", "");
			Color backgroundColor = Color.decode(backgroundCode);

			String colorCode = "0x"+blockColor.replace("#", "");
			Color blockColor = Color.decode(colorCode);

			// generate an image stream, clear it then set up for rendering the matrix.
			BufferedImage image = new BufferedImage(matrix.getWidth(), matrix.getHeight(), BufferedImage.TYPE_INT_RGB);
			Graphics2D graphics = (Graphics2D)image.getGraphics();
			graphics.setBackground(backgroundColor);
			graphics.clearRect(0, 0, width, height);

			// render the matrix, where there's a 0 draw a dark block 
			for(int y = 0; y < matrix.getHeight(); y++) {
			  for(int x = 0; x < matrix.getWidth(); x++) {
				if(matrix.get(x,y) == 0) {
				  drawBlock(graphics, blockColor, x, y,1,1);
				}
				else {
				  drawBlock(graphics, backgroundColor, x, y,1,1);
				}
			  }
			}
			// the now rendered matrix is one pixel per block. This is usually far too small
			// to be useful. So we need to scale up the image and then write out
			AffineTransform transform = new AffineTransform();
			transform.scale(scaleX,scaleY);
			graphics.transform(transform);

			AffineTransformOp op = new AffineTransformOp(transform, AffineTransformOp.TYPE_NEAREST_NEIGHBOR);
			image = op.filter(image, null);

			ParameterBlock pb = new ParameterBlock();
			pb.add(image);
			renderedImage = (PlanarImage) JAI.create("awtImage", pb);
			}catch(WriterException wex){
				wex.printStackTrace(System.err);
				}
		return renderedImage.getAsBufferedImage();
	}
}
