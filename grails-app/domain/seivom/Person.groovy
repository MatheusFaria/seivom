package seivom

class Person {

	transient springSecurityService

        String realname
	String username
	String password
        String email
	boolean enabled = true
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

        static hasMany = [reviewedmovies: Movie, watchlater: Movie, watchedmovies: Movie]

        static transients = ['springSecurityService']
	static constraints = {
		username blank: false, unique: true
		password blank: false
                realname blank: false
                email blank: false
                reviewedmovies nullable: true
                watchedmovies nullable: true
                watchlater nullable: true
	}

	static mapping = {
		password column: '`password`'
	}

	Set<Authority> getAuthorities() {
		PersonAuthority.findAllByPerson(this).collect { it.authority } as Set
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService.encodePassword(password)
	}
}
