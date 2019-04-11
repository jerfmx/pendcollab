package pendcolab

/**
 * Request Map domain class.
 */
class Reqmap {

	String url
	String configAttribute

	static constraints = {
		url(blank: false, unique: true)
		configAttribute(blank: false)
	}
}
