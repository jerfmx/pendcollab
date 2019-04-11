package pendcolab

import org.springframework.security.context.SecurityContextHolder as SCH
import pendcolab.*

class LoginFilters {

   def filters = {
        acegiLogin(uri:'*/j_acegi_security_check/*') {
            // println "Acegi Login Filter"

            def auth = SCH?.context?.authentication
            if (auth?.authenticated) {
                def usuario = auth?.principal?.getUsername()
                session?.usuario = Usuario.findByUsuario(usuario);
            }
        }

        userCreateFilter(controller:'*', action:'*') {
              before = {
                // println "Todo Filter"
                // temporay
                def auth = SCH?.context?.authentication
                // ROLE_ANONYMOUS
                if (auth?.authenticated && auth?.principal != 'anonymousUser') {
                    def usuario = auth?.principal?.getUsername()
                    session?.usuario = Usuario.findByUsuario(usuario);
                }
              }
        }
   }
}
