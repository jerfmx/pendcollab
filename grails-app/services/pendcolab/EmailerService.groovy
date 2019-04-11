package pendcolab

import org.apache.log4j.Logger
import org.springframework.core.io.InputStreamResource
import org.springframework.core.io.ByteArrayResource
import org.springframework.mail.MailException
import org.springframework.mail.MailSender
import org.springframework.mail.javamail.MimeMessageHelper
import javax.mail.internet.MimeMessage
import javax.mail.internet.InternetAddress

class EmailerService {

    static transactional = false
    MailSender mailSender

    def sendEmail = { mail, attachments ->
    	MimeMessage mm = mailSender.createMimeMessage()
		MimeMessageHelper mmh = new MimeMessageHelper(mm,true,"ISO-8859-1")
		mmh.from = getInternetAddress("joseeduardo.razo@upaep.mx")
		mmh.to = getInternetAddress(mail.para)
		mmh.subject = mail.titulo
		mmh.setText(mail.texto,true)
		if(mail.bcc) mmh.bcc = getInternetAddress(mail.bcc)
		if(mail.cc) mmh.cc = getInternetAddress(mail.cc)
		attachments.each{ key,value ->
			mmh.addAttachment(key,new ByteArrayResource(value))
		}
		mailSender.send(mm)
    }
    
    private getInternetAddress = { email ->
    	InternetAddress ma
    	ma=new InternetAddress(email)
    	return ma
    }
}
