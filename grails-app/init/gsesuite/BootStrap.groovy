package gsesuite

class BootStrap {
    def springSecurityService
    def init = { servletContext ->




        def suser= new User(username:'test',password:'test').save(flush: true)
        def testUser = new User(username: 'admin', password: 'admin').save(flush:true)

        //def testUser = new User(username: 'admin', enabled: true, password: 'admin')
        // def role = new Authority(authority:"ROLE_USER").save(flush: true)



        // def userRole = new Role ('ROLE_USER').save(flush:true)
        def userRole = new Role(authority: 'ROLE_USER').save(flush: true)

        //def savefinal = UserAuthority.create testUser, adminRole, true

        UserRole.create suser, userRole

        UserRole.withSession {
            it.flush()

        }
    }
    def destroy = {
    }
}
