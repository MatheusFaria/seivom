package seivom

class Movie {

	static hasMany = [actors: Actor, reviews: Review]
	Director director
	Studio studio

    static constraints = {
    	reviews nullable: true
    	actors nullable: true
    }
}
