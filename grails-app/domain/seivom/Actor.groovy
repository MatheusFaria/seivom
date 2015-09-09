package seivom

class Actor {

	static hasMany = [movies: Movie]

    static constraints = {
    	movies nullable: true
    }
}
