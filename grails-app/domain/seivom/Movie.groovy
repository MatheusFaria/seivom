package seivom

class Movie {

    static belongsTo = Actor
    static hasMany = [actors: Actor, reviews: Review]
    Director director
    Studio studio
    String title
    String decription
    String genre
    Date year
    int duration

    static constraints = {
    	reviews nullable: true
    }
}
