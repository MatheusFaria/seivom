package seivom

class Director {

	static hasMany = [movies: Movie]

	String name

    static constraints = {
        name blank: false
    	movies nullable: true
    }

    String toString() {
        return name
    }
}
