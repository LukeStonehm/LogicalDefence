package za.co.lukestonehm.logicaldefence;

import android.app.Activity;
import android.graphics.Color;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.view.GravityCompat;
import android.support.v4.widget.DrawerLayout;
import android.support.v7.app.ActionBarActivity;
import android.support.v7.app.ActionBarDrawerToggle;
import android.support.v7.widget.Toolbar;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.TextView;


public class MainActivity extends ActionBarActivity
        implements NavCallback {


    public static final String TAG = "LogicalDefence";

    private CharSequence mTitle;
    private String[] sections;

    private int mCurrentSelectedPosition = 0;

    private DrawerLayout mDrawerLayout;
    private ActionBarDrawerToggle mDrawerToggle;
    private ListView mDrawerListView;

    NavCallback mCallbacks;
    Menu currentActionViewMenu;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        drawScreen();
    }

    private void drawScreen() {
        setContentView(R.layout.activity_main);
        mCallbacks = this;

        mDrawerLayout = (DrawerLayout) findViewById(R.id.drawer_layout);
        mDrawerLayout.setDrawerShadow(R.drawable.drawer_shadow, GravityCompat.START);

        sections = getResources().getStringArray(R.array.sections);

        Toolbar mActionBar = (Toolbar) findViewById(R.id.action_bar);
        setSupportActionBar(mActionBar);

        mDrawerToggle = new ActionBarDrawerToggle(
                this,                    /* host Activity */
                mDrawerLayout,                    /* DrawerLayout object */
                R.string.navigation_drawer_open,  /* "open drawer" description for accessibility */
                R.string.navigation_drawer_close  /* "close drawer" description for accessibility */
        ) {
            @Override
            public void onDrawerClosed(View drawerView) {
                super.onDrawerClosed(drawerView);
            }

            @Override
            public void onDrawerOpened(View drawerView) {
                super.onDrawerOpened(drawerView);
            }
        };

        mDrawerLayout.setDrawerListener(mDrawerToggle);
        mDrawerToggle.syncState();

        mDrawerListView = (ListView) findViewById(R.id.lv);
        mDrawerListView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                TextView tv = (TextView) parent.getChildAt(mCurrentSelectedPosition);
                tv.setBackgroundColor(Color.TRANSPARENT);
                tv.setTextColor(getResources().getColor(R.color.primary_dark_material_dark));

                tv = (TextView) view;
                tv.setBackgroundColor(getResources().getColor(R.color.colorPrimary));
                tv.setTextColor(Color.WHITE);
                selectItem(position);
            }
        });

        mDrawerListView.setAdapter(new ArrayAdapter<>(
                this,
                R.layout.nav_item,
                R.id.nav_item, sections
        ));

        //TODO: Pref this
        mTitle = sections[mCurrentSelectedPosition];
        setTitle(mTitle);
        mDrawerListView.setItemChecked(mCurrentSelectedPosition, true);
        changeSection(mCurrentSelectedPosition);
    }

    private void selectItem(int position) {
        mCurrentSelectedPosition = position;

        mDrawerListView.setItemChecked(position, true);
        mDrawerLayout.closeDrawers();
        mCallbacks.onNavigationDrawerItemSelected(position);

        mTitle = sections[position];
        setTitle(mTitle);
    }

    private void changeSection(int position) {
        FragmentManager fragmentManager = getSupportFragmentManager();
        fragmentManager.beginTransaction()
                .replace(R.id.container, PlaceholderFragment.newInstance(position + 1))
                .commit();
    }

    @Override
    public void onNavigationDrawerItemSelected(int position) {
        // update the main content by replacing fragments
        changeSection(position);
    }

    public void onSectionAttached(int number) {
        mTitle = sections[number - 1];
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.main, menu);
        currentActionViewMenu = menu;
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        if (mDrawerToggle.onOptionsItemSelected(item)) {
            return true;
        }
        Log.d(TAG, "TEST");
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_about) {
            return true;
        }

        return super.onOptionsItemSelected(item);
    }

    /**
     * A placeholder fragment containing a simple view.
     */
    public static class PlaceholderFragment extends Fragment {
        /**
         * The fragment argument representing the section number for this
         * fragment.
         */
        private static final String ARG_SECTION_NUMBER = "section_number";

        /**
         * Returns a new instance of this fragment for the given section
         * number.
         */
        public static PlaceholderFragment newInstance(int sectionNumber) {
            PlaceholderFragment fragment = new PlaceholderFragment();
            Bundle args = new Bundle();
            args.putInt(ARG_SECTION_NUMBER, sectionNumber);
            fragment.setArguments(args);
            return fragment;
        }

        public PlaceholderFragment() {
        }

        @Override
        public View onCreateView(LayoutInflater inflater, ViewGroup container,
                                 Bundle savedInstanceState) {
            View v = inflater.inflate(R.layout.fragment_main, container, false);
            TextView tv = (TextView) v.findViewById(R.id.section_label);
            tv.setText("Section: " + getArguments().getInt(ARG_SECTION_NUMBER));
            //TODO: display things here
            return v;
        }

        @Override
        public void onAttach(Activity activity) {
            super.onAttach(activity);
            ((MainActivity) activity).onSectionAttached(
                    getArguments().getInt(ARG_SECTION_NUMBER));
        }
    }

}
