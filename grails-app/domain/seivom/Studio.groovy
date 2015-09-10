package seivom

class Studio {

	static hasMany = [movies: Movie]

	String name
	String country

    static constraints = {
    	movies nullable: true
    }

    String toString() {
        return name
    }
}
