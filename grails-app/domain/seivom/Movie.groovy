package seivom

class Movie {

    static belongsTo = Actor
    static hasMany = [actors: Actor, reviews: Review, genres: Genre]
    Director director
    Studio studio
    String title
    String description
    Date year
    int duration
    byte[] poster
    String posterType

    static constraints = {
    	reviews nullable: true
        genres nullable: true
        title blank: false
        poster maxSize: 524288 /* 512K */
    }

    static mapping = {
        poster column: 'poster', sqlType: 'blob'    	
    }

    String toString() {
        return title
    }
}
