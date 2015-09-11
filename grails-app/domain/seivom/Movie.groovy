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
        director nullable: true
        studio nullable: true
        title blank: false
        poster nullable: true
        posterType nullable: true
        poster maxSize: 131072 /* 128K */
    }

    static mapping = {
        poster column: 'poster', sqlType: 'blob'    	
    }

    String toString() {
        return title
    }
}
