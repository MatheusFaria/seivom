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
        new Movie(title: "The Godfather", description: "The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.",
            duration: 175, year: new Date(), poster: new File("web-app/images/godfather.jpg").bytes, posterType: "image/jpg").save()
        new Movie(title: "Pulp Fiction", description: "The lives of two mob hit men, a boxer, a gangster's wife, and a pair of diner bandits intertwine in four tales of violence and redemption.",
            duration: 154, year: new Date(), poster: new File("web-app/images/pulp-fiction.jpg").bytes, posterType: "image/jpg").save()
        new Movie(title: "Fight Club", description: "An insomniac office worker, looking for a way to change his life, crosses paths with a devil-may-care soap maker, forming an underground fight club that evolves into something much, much more...",
            duration: 139, year: new Date(), poster: new File("web-app/images/fight-club.jpg").bytes, posterType: "image/jpg").save()
        new Movie(title: "Forrest Gump", description: "Forrest Gump, while not intelligent, has accidentally been present at many historic moments, but his true love, Jenny Curran, eludes him.",
            duration: 142, year: new Date(), poster: new File("web-app/images/forest-gump.jpg").bytes, posterType: "image/jpg").save()
        new Movie(title: "The Matrix", description: "A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers.", 
            duration: 136, year: new Date(), poster: new File("web-app/images/matrix.jpg").bytes, posterType: "image/jpg").save()

    }

    private void createGenres() {
        ["Action", "Animation", "Comedy", "Documentary", "Family", "Film-Noir", "Horror", "Musical", "Romance", "Sport", "War",
          "Adventure", "Biography", "Crime", "Drama", "Fantasy", "History", "Mystery", "Music", "Sci-Fi", "Thriller", "Western" ].each { name ->
            def genre = new Genre(name: name).save()
        }
    }
}
