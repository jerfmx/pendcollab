package pendcolab

import javax.mail.Authenticator

class SmtpAuthenticator extends Authenticator{
	private String user
	private String pass
	
	public SmtpAuthenticator(String user, String pass){
		super()
		this.user=user
		this.pass=pass
	}
	
	public javax.mail.PasswordAuthentication getPasswordAuthentication(){
		return new javax.mail.PasswordAuthentication(user, pass)
	}
}
