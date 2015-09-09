import seivom.Person
import seivom.Movie

class HomeController {
        def springSecurityService

        def index = {
                if (springSecurityService.isLoggedIn()) {
                        def person = springSecurityService.currentUser
                        def m = new Movie(name: "Mad Max")
                        def watchedmovies = [m, m, m]
                        params.person = person
                        params.movies = watchedmovies
                        //render template: 'movies', collection: watchedmovies, var: 'movie'
                }
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
                params.successful_sign_up = true
                redirect controller: 'login', action: 'auth', params: params
            }
            else {
                params.error_flag = true
                redirect controller: 'home', action: 'signup', params: params
            }
        }
}
