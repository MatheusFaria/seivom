package seivom

class Actor {

    static hasMany = [movies: Movie]
    String name

    static constraints = {
    	movies nullable: true
    }
}
