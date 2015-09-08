import seivom.Person

class HomeController {
        def springSecurityService

        def index = {
        }

        def signup = {
                if (springSecurityService.isLoggedIn()) {
                        redirect uri: '/'
                }
        }

        def createUser = {
            def person = new Person(
                username: params.username,
                realname: params.realname,
                password: params.password,
                email: params.email,
                enabled: true)

            if(person.validate()) {
                person.save()
                redirect controller: 'login', action: 'auth', params: params
            }
            else {
                params.error_flag = true
                redirect controller: 'home', action: 'signup', params: params
            }
        }
}
