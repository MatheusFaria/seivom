package seivom

class Director {

	static hasMany = [movies: Movie]

	String name

    static constraints = {
    	movies nullable: true
    }

    String toString() {
        return name
    }
}
