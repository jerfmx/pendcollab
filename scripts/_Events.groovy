import org.apache.catalina.valves.AccessLogValve

eventConfigureTomcat = { tomcat ->
 tomcat.host.addValve new AccessLogValve(
  directory: basedir, prefix: 'localhost_access_log.', pattern: 'common')
}
