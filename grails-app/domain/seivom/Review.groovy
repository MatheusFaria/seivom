package seivom

class Review {

    static belongsTo = [movie: Movie, person: Person]
    String comment
    Integer rate

    static constraints = {
        comment blank: false
        rate range: 0..5
    }
}
