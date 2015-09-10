package seivom

class Movie {

    static belongsTo = Actor
    static hasMany = [actors: Actor, reviews: Review, genres: Genre]
    Director director
    Studio studio
    String title
    String decription
    Date year
    int duration

    static constraints = {
    	reviews nullable: true
    	genres nullable: true

        title blank: false
    }

    String toString() {
        return title
    }
}
