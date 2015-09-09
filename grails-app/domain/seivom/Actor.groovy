package seivom

class Actor {

	static belongsTo = Movie
	static hasMany = [movies: Movie]

    static constraints = {
    	movies nullable: true
    }
}
