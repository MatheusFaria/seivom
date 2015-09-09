package seivom

class Director {

	static hasMany = [movie: Movie]

	String name

    static constraints = {
    	movie nullable: true
    }
}
