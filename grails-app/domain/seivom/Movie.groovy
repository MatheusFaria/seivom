package seivom

class Movie {

        static hasMany = [actors: Actor, reviews: Review]
        Director director
        Studio studio
        String title
        String decription

    static constraints = {
    	reviews nullable: true
    	actors nullable: true
    }
}
