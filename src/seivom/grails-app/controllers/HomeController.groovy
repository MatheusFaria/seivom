class HomeController {
        def index = {
        }

        def signup = {
        }

        def login = {
                redirect controller: 'login', action: 'auth', params: params
        }
}
