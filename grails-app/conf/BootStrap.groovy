import seivom.*


class BootStrap {

    def init = { servletContext ->
        if(!Person.count()){
            createAdmin()
            createUsers()
            createGenres()
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

        def user = new Person(username: 'admin', realname: "Admin", password: password, email: "admin@email.com", enable: true).save()
        PersonAuthority.create user, userRole, true
    }

    private void createUsers() {
        def userRole = new Authority(authority: 'ROLE_USER').save()
        String password = 'password'

        [jorge: "Jorge Reis", john: "John Doe", jane: "Jane Smith", jack: "Jack Shepard", kate: "Kate Austin", will: "Will I Am"].each { username, realname ->
            def user = new Person(username: username, realname: realname, password: password, email: username + "@email.com", enable: true).save()

            PersonAuthority.create user, userRole, true
        }
    }

    private void createDirectors() {
        ["Steven Spielberg", "Martin Scorsese", "Alfred Hitchcock", "Stanley Kubrick", "Quentin Tarantino"].each { realname ->
            def director = new Director(name: realname).save()
        }
    }

    private void createActors() {
        ["Jack Nicholson", "Ralph Fiennes", "Daniel Day-Lewis", "Robert De Niro", "Al Pacino"].each { realname ->
            def actor = new Actor(name: realname).save()
        }
    }

    private void createStudios() {
        ["20th Century Fox": "USA", "The Walt Disney Company": "USA", "Viacom": "USA", "Sony": "USA", "Time Warner": "USA",].each { name, country ->
            def studio = new Studio(name: name, country: country).save()
        }
    }

    private void createMovies() {
    }

    private void createGenres() {
        ["Action", "Animation", "Comedy", "Documentary", "Family", "Film-Noir", "Horror", "Musical", "Romance", "Sport", "War",
          "Adventure", "Biography", "Crime", "Drama", "Fantasy", "History", "Mystery", "Music", "Sci-Fi", "Thriller", "Western" ].each { name ->
            def genre = new Genre(name: name).save()
        }
    }
}
