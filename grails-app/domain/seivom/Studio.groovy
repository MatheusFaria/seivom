package seivom

class Studio {

	static hasMany = [movie: Movie]

	String name
	String country

    static constraints = {
    	movie nullable: true
    }

    String toString() {
        return name
    }
}
