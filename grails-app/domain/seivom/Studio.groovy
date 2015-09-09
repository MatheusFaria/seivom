package seivom

class Studio {

	static hasMany = [movie: Movie]

    static constraints = {
    	movie nullable: true
    }
}
