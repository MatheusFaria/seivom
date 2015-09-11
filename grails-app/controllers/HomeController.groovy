import seivom.Person
import seivom.Movie
import seivom.Authority
import seivom.PersonAuthority

class HomeController {
        def springSecurityService

        def index = {
                if (springSecurityService.isLoggedIn()) {
                        def person = springSecurityService.currentUser
                        params.person = person
                        def movielist = [[title: "Reviewed Movies", value: person.reviewedmovies()]]
                        return [movielist: movielist]
                }
        }

        def show_list = {
                if (springSecurityService.isLoggedIn()) {
                        def person = springSecurityService.currentUser
                        def movielist = [[title: "Reviewed Movies", value: person.reviewedmovies()]]

                        if(params.id == "watched")
                        {
                            movielist = [[title: "Watched Movies", value: person.getWatchedMovies()]]
                        }
                        else if(params.id == "watchlater")
                        {
                            movielist = [[title: "Watch Later", value: person.watchlater]]
                        }

                        render template: 'displaymovielist', collection: movielist, var: 'movielist'
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

            def userRole = Authority.get(2)
            if(person.validate()) {
                person.save()
                params.successful_sign_up = true

                PersonAuthority.create person, userRole, true
                redirect controller: 'login', action: 'auth', params: params
            }
            else {
                params.error_flag = true
                redirect controller: 'home', action: 'signup', params: params
            }
        }
}
