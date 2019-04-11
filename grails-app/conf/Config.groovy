// locations to search for config files that get merged into the main config
// config files can either be Java properties files or ConfigSlurper scripts

/* grails.config.locations = [ "classpath:${appName}-config.properties",
                             "classpath:${appName}-config.groovy",
                             "file:${userHome}/.grails/${appName}-config.properties",
                             "file:${userHome}/.grails/${appName}-config.groovy"]

 if(System.properties["${appName}.config.location"]) {
    grails.config.locations << "file:" + System.properties["${appName}.config.location"]
 }*/

grails.project.groupId = appName // change this to alter the default package name and Maven publishing destination
grails.mime.file.extensions = true // enables the parsing of file extensions from URLs into the request format
grails.mime.use.accept.header = true
grails.mime.types = [ html: ['text/html','application/xhtml+xml'],
                      xml: ['text/xml', 'application/xml'],
                      text: 'text/plain',
                      js: 'text/javascript',
                      rss: 'application/rss+xml',
                      atom: 'application/atom+xml',
                      css: 'text/css',
                      csv: 'text/csv',
                      all: '*/*',
                      json: ['application/json','text/json'],
                      form: 'application/x-www-form-urlencoded',
                      multipartForm: 'multipart/form-data'
                    ]
//                      form: 'application/x-www-form-urlencoded',
//*/
// URL Mapping Cache Max Size, defaults to 5000
//grails.urlmapping.cache.maxsize = 1000

// The default codec used to encode data with ${}
grails.views.default.codec = "html" // none, html, base64
grails.views.gsp.encoding = "UTF-8"
grails.converters.encoding = "UTF-8"
// enable Sitemesh preprocessing of GSP pages
grails.views.gsp.sitemesh.preprocess = true
// scaffolding templates configuration
grails.scaffolding.templates.domainSuffix = 'Instance'

// Set to false to use the new Grails 1.2 JSONBuilder in the render method
grails.json.legacy.builder = false
// enabled native2ascii conversion of i18n properties files
grails.enable.native2ascii = true
// whether to install the java.util.logging bridge for sl4j. Disable for AppEngine!
grails.logging.jul.usebridge = true
// packages to include in Spring bean scanning
grails.spring.bean.packages = []

// request parameters to mask when logging exceptions
grails.exceptionresolver.params.exclude = ['password']

// set per-environment serverURL stem for creating absolute links
environments {
    production {
        grails.serverURL = "http://j:8080/${appName}"
   }
    development {
        grails.serverURL = "http://localhost:8080/${appName}" //-${appVersion}"
    }
    test {
        grails.serverURL = "http://localhost:8080/${appName}" //-${appVersion}"
    }

}

// log4j configuration
log4j = {
    // Example of changing the log pattern for the default console
    // appender:
    //
    appenders {
        console name:'stdout', layout:pattern(conversionPattern: '%c{2} %m%n')
    }
	
	info	'grails.app.controller',
			'grails.app.domain',
			'grails.app.service',
			'grails.app.tagLib'

    error  'org.codehaus.groovy.grails.web.servlet',  //  controllers
           'org.codehaus.groovy.grails.web.pages', //  GSP
           'org.codehaus.groovy.grails.web.sitemesh', //  layouts
           'org.codehaus.groovy.grails.web.mapping.filter', // URL mapping
           'org.codehaus.groovy.grails.web.mapping', // URL mapping
           'org.codehaus.groovy.grails.commons', // core / classloading
           'org.codehaus.groovy.grails.plugins', // plugins
           'org.codehaus.groovy.grails.orm.hibernate', // hibernate integration
           'org.springframework',
           'org.hibernate',
           'net.sf.ehcache.hibernate'

    warn   'org.mortbay.log'
}


log4j.logger.org.springframework.security='off,stdout'

//grails.views.javascript.library="jquery"
grails.views.javascript.library="dojo"

grails.war.dependencies = [
    "ant.jar",
    "ant-launcher.jar",
    "hibernate3.jar",
    "jdbc2_0-stdext.jar",
    "jta.jar",
    "groovy-all-*.jar",
    "springmodules-sandbox.jar",
    "standard-${servletVersion}.jar",
    "jstl-${servletVersion}.jar",
    "antlr-*.jar",
    "cglib-*.jar",
    "dom4j-*.jar",
    "ehcache-*.jar",
    "junit-*.jar",
    "commons-logging-*.jar",
    "sitemesh-*.jar",
    "spring-*.jar",
    "log4j-*.jar",
    "ognl-*.jar",
    "hsqldb-*.jar",
    "commons-lang-*.jar",
    "commons-collections-*.jar",
    "commons-beanutils-*.jar",
    "commons-pool-*.jar",
    "commons-dbcp-*.jar",
    "commons-cli-*.jar",
    "commons-validator-*.jar",
    "commons-fileupload-*.jar",
    "commons-io-*.jar",
    "commons-io-*.jar",
    "*oro-*.jar",
    "jaxen-*.jar",
    "xercesImpl.jar",
    "xstream-1.2.1.jar",
    "xpp3_min-1.1.3.4.O.jar"
]

grails.war.java5.dependencies = [
    "hibernate-annotations.jar",
    "ejb3-persistence.jar",
]

grails.plugins.dynamicController.mixins = [
   'com.burtbeckwith.grails.plugins.appinfo.IndexControllerMixin':       'com.burtbeckwith.appinfo_test.AdminManageController',
   'com.burtbeckwith.grails.plugins.appinfo.HibernateControllerMixin':   'com.burtbeckwith.appinfo_test.AdminManageController',
   'com.burtbeckwith.grails.plugins.appinfo.Log4jControllerMixin' :      'com.burtbeckwith.appinfo_test.AdminManageController',
   'com.burtbeckwith.grails.plugins.appinfo.SpringControllerMixin' :     'com.burtbeckwith.appinfo_test.AdminManageController',
   'com.burtbeckwith.grails.plugins.appinfo.MemoryControllerMixin' :     'com.burtbeckwith.appinfo_test.AdminManageController',
   'com.burtbeckwith.grails.plugins.appinfo.PropertiesControllerMixin' : 'com.burtbeckwith.appinfo_test.AdminManageController',
   'com.burtbeckwith.grails.plugins.appinfo.ScopesControllerMixin' :     'com.burtbeckwith.appinfo_test.AdminManageController',
   'com.burtbeckwith.grails.plugins.appinfo.ThreadsControllerMixin' :    'com.burtbeckwith.appinfo_test.AdminManageController'
]

compress {
	// just in case for some reason you want to disable the filter
	enabled = true

	debug = false
	statsEnabled = true
	compressionThreshold = 1024
	// filter's url-patterns 
	urlPatterns = ['/','/usuario/*','/admin/*','/reqmap/*','/auth/*','/pendiente/*','/adminmanage/*',
							 '/ck/*','/ajaxupload/*','/twitterChecker/*']
	//*/
	// include and exclude are mutually exclusive
	includePathPatterns = []
	excludePathPatterns = [".*\\.gif", ".*\\.ico", ".*\\.jpg", ".*\\.swf"]
	// include and exclude are mutually exclusive 
	includeContentTypes = []
	excludeContentTypes = ["image/png","plain/text"]
	// include and exclude are mutually exclusive 
	includeUserAgentPatterns = []
	excludeUserAgentPatterns = [".*MSIE 4.*"]
	// probably don't want these, but their available if needed
	javaUtilLogger = ""
	jakartaCommonsLogger = ""

	development {
		debug = true
		compressionThreshold = 2048
		}
	production {
		statsEnabled = false
		} 
}

emailvalidator.checkDomains=true
emailvalidator.checkVRFY=false
emailvalidator.useCache=true

emailConfirmation.from="joseeduardo.razo@upaep.mx"

grails.mail.host = 'smtp.gmail.com' // Duh, don't try this at home!
grails.mail.port = 465
grails.mail.username = 'joseeduardo.razo@upaep.mx'
grails.mail.password = 'erf770426'
grails.mail.props = ["mail.smtp.auth":"true",
					 "mail.smtp.socketFactory.port":"465",
					 "mail.smtp.socketFactory.class":"javax.net.ssl.SSLSocketFactory",
					 "mail.smtp.socketFactory.fallback":"false"]

//grails.plugins.appinfo.dotPath = 'C:/Archivos de programa/Graphviz 2.28/bin/dot.exe' 

// Added by the Joda-Time plugin:
/*grails.gorm.default.mapping = {
	"user-type" type: org.joda.time.contrib.hibernate.PersistentDateTime, class: org.joda.time.DateTime
	"user-type" type: org.joda.time.contrib.hibernate.PersistentDuration, class: org.joda.time.Duration
	"user-type" type: org.joda.time.contrib.hibernate.PersistentInstant, class: org.joda.time.Instant
	"user-type" type: org.joda.time.contrib.hibernate.PersistentInterval, class: org.joda.time.Interval
	"user-type" type: org.joda.time.contrib.hibernate.PersistentLocalDate, class: org.joda.time.LocalDate
	"user-type" type: org.joda.time.contrib.hibernate.PersistentLocalTimeAsString, class: org.joda.time.LocalTime
	"user-type" type: org.joda.time.contrib.hibernate.PersistentLocalDateTime, class: org.joda.time.LocalDateTime
	"user-type" type: org.joda.time.contrib.hibernate.PersistentPeriod, class: org.joda.time.Period
}*/

def foo = getClass().getProtectionDomain().getCodeSource().getLocation()
      .getFile().replace("/WEB-INF/classes/" + getClass().getSimpleName() + ".class", "")
//      .substring(1) // jerf - tomcat
     
music.location='web-app/music/' //jerf
//music.location="/${foo}/music/" //jerf - tomcat

grails.spring.bean.packages = ["twitterChecker"]

twitterChecker {
    oauth.consumerKey = "TcU5OoQzyavI2Uap8EFFg"
    oauth.consumerSecret = "sFMFc6jU42fZnXu6ogPAGHFEhLwmQD7LoiT3KhQ"
    storageFolder = "web-app/twit" //jerf
    //storageFolder = "/${foo}/twit" //jerf tomcat
    twitterChecker.token="141416765-lQvSBjljxTL2opxo5z1DMyygGPKke105Sp5vPgsy"
    twitterChecker.tokenSecret="b2yTYalcW5uY8SJ7aEw42lR0fRk1uQngx2SCPA5KZAw"
}

// Prevent any client side caching for now
cache.headers.enabled = true

cache.headers.presets = [
    unauthed_page: [shared:true, validFor: 300], // 5 minute refresh window
    authed_page: false, // No caching for logged in user
    content: [shared:true, validFor: 3600], // 1hr on content
    recent_items_feed: [shared: true, validFor: 1800], // 30 minute throttle on RSS updates
    search_results: [validFor: 60, shared: true],
    taxonomy_results: [validFor: 60, shared: true]
]

