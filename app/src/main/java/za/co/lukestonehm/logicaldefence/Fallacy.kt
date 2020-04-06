package za.co.lukestonehm.logicaldefence

/**
 * Custom object that represents a fallacy
 */
class Fallacy(val pos: Int, val title: String, val desc: String, val example: String) {

    override fun toString(): String {
        return """
            $pos
            $title
            $desc
            """.trimIndent()
    }

    val shareString: String
        get() = """
            $title
            $desc
            $example
            """.trimIndent()

}