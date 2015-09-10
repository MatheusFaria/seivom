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
    byte[] poster
    String posterType

    static constraints = {
    	reviews nullable: true
        poster(maxSize: 524288 /* 512K */)
    }

    static mapping = {
        poster column: 'poster', sqlType: 'blob'
    }
}
