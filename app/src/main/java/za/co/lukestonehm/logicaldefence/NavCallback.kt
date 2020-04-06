package za.co.lukestonehm.logicaldefence

/**
 * Callbacks interface that all activities using this fragment must implement.
 */
interface NavCallback {
    /**
     * Called when an item in the navigation drawer is selected.
     */
    fun onNavigationDrawerItemSelected(position: Int)
}