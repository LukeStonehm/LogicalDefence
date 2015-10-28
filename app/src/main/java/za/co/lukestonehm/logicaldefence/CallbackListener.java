package za.co.lukestonehm.logicaldefence;

/**
 * Callbacks interface that all activities using this fragment must implement.
 */
public interface CallbackListener {
    /**
     * Called when an item in the navigation drawer is selected.
     */
    void onNavigationDrawerItemSelected(int position);

    void httpResult(String result);
}