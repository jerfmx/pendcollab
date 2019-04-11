package pendcolab

import org.krysalis.barcode4j.impl.code128.Code128Bean
import java.text.*

class BarcodeController {

    def index = {
    	redirect(action:'barcode',params:params)
    }
    
    def barcode = {
		def generator = new Code128Bean()
        generator.height = 10
        Pendiente p=Pendiente.get(params.id)
        def n=p.nombre.toUpperCase()
        def d=new SimpleDateFormat("yyyyMMddhhmm").format(p.iniciado)
		String barcodeValue = "${p.id}${n}${d}"
		//println barcodeValue
		renderBarcodePng(generator, barcodeValue)
    }
}
