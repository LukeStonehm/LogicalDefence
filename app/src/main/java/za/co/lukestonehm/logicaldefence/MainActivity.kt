package za.co.lukestonehm.logicaldefence

import android.app.Activity
import android.content.Intent
import android.graphics.Color
import android.os.Bundle
import android.view.*
import android.widget.AdapterView.OnItemClickListener
import android.widget.ArrayAdapter
import android.widget.ListView
import android.widget.TextView
import androidx.appcompat.app.ActionBarDrawerToggle
import androidx.appcompat.app.AlertDialog
import androidx.appcompat.app.AppCompatActivity
import androidx.appcompat.widget.Toolbar
import androidx.core.view.GravityCompat
import androidx.drawerlayout.widget.DrawerLayout
import androidx.fragment.app.Fragment
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import java.util.*

class MainActivity : AppCompatActivity(), NavCallback {
    private var mTitle: CharSequence? = null
    private var sections: Array<String>? = null
    private var mCurrentSelectedPosition = 0
    private var mDrawerLayout: DrawerLayout? = null
    private var mDrawerToggle: ActionBarDrawerToggle? = null
    private var mDrawerListView: ListView? = null
    var locales: Array<String> = arrayOf()
    var languages: Array<String> = arrayOf()
    var mCallbacks: NavCallback? = null
    var currentActionViewMenu: Menu? = null
    var appPrefs: AppPreferences? = null
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        drawScreen()
    }

    private fun drawScreen() {
        setContentView(R.layout.activity_main)
        mCallbacks = this
        appPrefs = AppPreferences(this)
        mDrawerLayout = findViewById<View>(R.id.drawer_layout) as DrawerLayout
        mDrawerLayout!!.setDrawerShadow(R.drawable.drawer_shadow, GravityCompat.START)
        locales = resources.getStringArray(R.array.supported_locales)
        languages = resources.getStringArray(R.array.locale_names)
        setLocale(appPrefs!!.locale)

        //load sections after locale setup
        sections = resources.getStringArray(R.array.sections)
        val mActionBar = findViewById<Toolbar>(R.id.action_bar)
        setSupportActionBar(mActionBar)
        mDrawerToggle = object : ActionBarDrawerToggle(
                this,  /* host Activity */
                mDrawerLayout,  /* DrawerLayout object */
                R.string.navigation_drawer_open,  /* "open drawer" description for accessibility */
                R.string.navigation_drawer_close /* "close drawer" description for accessibility */
        ) {
            override fun onDrawerClosed(drawerView: View) {
                super.onDrawerClosed(drawerView)
            }

            override fun onDrawerOpened(drawerView: View) {
                setDrawerItemSelected(mDrawerListView!!.getChildAt(mCurrentSelectedPosition) as TextView)
                super.onDrawerOpened(drawerView)
            }
        }
        mDrawerLayout!!.setDrawerListener(mDrawerToggle)
        val ab = supportActionBar
        ab?.setDisplayHomeAsUpEnabled(true)
        mDrawerToggle!!.syncState()
        mDrawerListView = findViewById<View>(R.id.lv) as ListView
        mDrawerListView!!.onItemClickListener = OnItemClickListener { parent, view, position, id ->
            unsetDrawerItemSelected(parent.getChildAt(mCurrentSelectedPosition) as TextView)
            setDrawerItemSelected(view as TextView)
            selectItem(position)
        }
        mDrawerListView!!.adapter = ArrayAdapter(
                this,
                R.layout.nav_item,
                R.id.nav_item, sections!!
        )
        mCurrentSelectedPosition = appPrefs!!.section
        mTitle = sections!![mCurrentSelectedPosition]
        title = mTitle
        mDrawerListView!!.setItemChecked(mCurrentSelectedPosition, true)
        changeSection(mCurrentSelectedPosition)
    }

    private fun selectItem(position: Int) {
        mCurrentSelectedPosition = position
        mDrawerListView!!.setItemChecked(position, true)
        mDrawerLayout!!.closeDrawers()
        mCallbacks!!.onNavigationDrawerItemSelected(position)
        if (appPrefs == null) appPrefs = AppPreferences(this)
        appPrefs!!.section = position
        mTitle = sections!![position]
        title = mTitle
    }

    private fun changeSection(position: Int) {
        val fragmentManager = supportFragmentManager
        fragmentManager.beginTransaction()
                .replace(R.id.container, PlaceholderFragment.newInstance(position + 1))
                .commit()
    }

    private fun setDrawerItemSelected(item: TextView?) {
        if (item != null) {
            item.setBackgroundColor(resources.getColor(R.color.colorPrimary))
            item.setTextColor(Color.WHITE)
        }
    }

    private fun unsetDrawerItemSelected(item: TextView?) {
        if (item != null) {
            item.setBackgroundColor(Color.TRANSPARENT)
            item.setTextColor(resources.getColor(R.color.primary_dark_material_dark))
        }
    }

    override fun onNavigationDrawerItemSelected(position: Int) {
        // update the main content by replacing fragments
        changeSection(position)
    }

    fun onSectionAttached(number: Int) {
        if (sections == null) sections = resources.getStringArray(R.array.sections)
        mTitle = sections!![number - 1]
    }

    override fun onCreateOptionsMenu(menu: Menu): Boolean {
        menuInflater.inflate(R.menu.main, menu)
        currentActionViewMenu = menu
        return true
    }

    override fun onOptionsItemSelected(item: MenuItem): Boolean {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        if (mDrawerToggle!!.onOptionsItemSelected(item)) {
            return true
        }
        val id = item.itemId
        if (id == R.id.action_about) {
            startActivity(Intent(this, About::class.java))
            return true
        }
        if (id == R.id.action_language) {

            //Create Alert dialog to choose language from
            val builder = AlertDialog.Builder(this)
            builder.setTitle(R.string.language_dialog_title)
            builder.setItems(languages) { dialog, which ->
                setLocale(which)
                val refresh = Intent(applicationContext, MainActivity::class.java)
                startActivity(refresh)
                finish()
            }
            builder.show()
            return true
        }
        return super.onOptionsItemSelected(item)
    }

    /**
     * Set the selected language
     *
     * @param which position in locale array
     * @see [how-to-change-language-of-app-when-user-selects-language](http://stackoverflow.com/questions/12908289/how-to-change-language-of-app-when-user-selects-language)
     */
    fun setLocale(which: Int) {
        if (which > -1) {
            val newLocale = Locale(locales[which])
            val config = resources.configuration
            config.locale = newLocale
            resources.updateConfiguration(config, resources.displayMetrics)
            appPrefs!!.locale = which //save locale
        }
    }

    /**
     * A placeholder fragment containing a simple view.
     */
    class PlaceholderFragment : Fragment() {
        override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?,
                                  savedInstanceState: Bundle?): View? {
            val v = inflater.inflate(R.layout.fragment_main, container, false)
            val titles = getStringArrByName("fallacies_titles_" + arguments!!.getInt(ARG_SECTION_NUMBER))
            val descs = getStringArrByName("fallacies_descs_" + arguments!!.getInt(ARG_SECTION_NUMBER))
            val examples = getStringArrByName("fallacies_examples_" + arguments!!.getInt(ARG_SECTION_NUMBER))
            val fallacies = generateFallacyList(titles, descs, examples)
            val mRecyclerView = v.findViewById<View>(R.id.sec_rv) as RecyclerView
            mRecyclerView.layoutManager = LinearLayoutManager(activity)
            val fla = FallacyListAdapter(activity!!, fallacies)
            mRecyclerView.adapter = fla
            return v
        }

        private fun getStringArrByName(name: String): Array<String> {
            val i = resources.getIdentifier(name, "array",
                    activity!!.applicationContext.packageName) // You had used "name"
            return resources.getStringArray(i)
        }

        override fun onAttach(activity: Activity) {
            super.onAttach(activity)
            (activity as MainActivity).onSectionAttached(
                    arguments!!.getInt(ARG_SECTION_NUMBER))
        }

        private fun generateFallacyList(titles: Array<String>, descs: Array<String>, examples: Array<String>): List<Fallacy> {
            val list: MutableList<Fallacy> = ArrayList()
            for (i in titles.indices) {
                list.add(Fallacy(i, titles[i], descs[i], examples[i]))
            }
            return list
        }

        companion object {
            /**
             * The fragment argument representing the section number for this
             * fragment.
             */
            private const val ARG_SECTION_NUMBER = "section_number"

            /**
             * Returns a new instance of this fragment for the given section
             * number.
             */
            fun newInstance(sectionNumber: Int): PlaceholderFragment {
                val fragment = PlaceholderFragment()
                val args = Bundle()
                args.putInt(ARG_SECTION_NUMBER, sectionNumber)
                fragment.arguments = args
                return fragment
            }
        }
    }

    companion object {
        const val TAG = "LogicalDefence"
    }
}