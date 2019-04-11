security {

	// see DefaultSecurityConfig.groovy for all settable/overridable properties

	active = true

	algorithm="MD5"
	encodeHashAsBase64=false
	
	defaultTargetUrl='/pendiente/list'
	alwaysUseDefaultTargetUrl=true
	forceHttps=true
	
	channelConfig = [secure:['/usuario/**','/admin/**','/reqmap/**','/auth/**','/pendiente/**','/jasper/**','/adminmanage/**',
							 '/ck/**','/barcode/**','/qrcode/**','/ajaxupload/**','/rest/**','/json/**','/userinfo/**'],
					 insecure:['/**']]
	
	loginUserDomainClass = "pendcolab.Usuario"
	userName="usuario"
	password="password"
	enabled="activo"
	description="descripcion"
	relationalAuthorities = "authorities"
	
	authorityDomainClass = "pendcolab.Auth"
	authorityField="authority"
	
	requestMapClass = "pendcolab.Reqmap"
	requestMapPathField="url"
	requestMapConfigAttributeField="configAttribute"
}
