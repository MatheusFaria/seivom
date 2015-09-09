package seivom

class Director {

	static hasMany = [movie: Movie]

    static constraints = {
    	movie nullable: true
    }
}
