import seivom.*


class BootStrap {

    def init = { servletContext ->
        if(!Person.count()){
            createAdmin()
            createUsers()
            createDirectors()
            createActors()
            createStudios()
            createMovies()
        }
    }

    def destroy = {
    }

    private void createAdmin() {
        def userRole = new Authority(authority: 'ROLE_ADMIN').save()
        String password = 'password'

        def user = new Person(username: 'admin', realname: "Admin", password: password, enable: true).save()
        PersonAuthority.create user, userRole, true
    }

    private void createUsers() {
        def userRole = new Authority(authority: 'ROLE_USER').save()
        String password = 'password'

        [jorge: "Jorge Reis", john: "John Doe", jane: "Jane Smith", jack: "Jack Shepard", kate: "Kate Austin", will: "Will I Am"].each { username, realname ->
            def user = new Person(username: username, realname: realname, password: password, enable: true).save()

            PersonAuthority.create user, userRole, true
        }
    }

    private void createDirectors() {
    }

    private void createActors() {
    }

    private void createStudios() {
    }

    private void createMovies() {
    }
}
