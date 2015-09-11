package seivom

class Genre {

    String name

    static constraints = {
        name blank: false
    }

    String toString() {
        return name
    }
}
