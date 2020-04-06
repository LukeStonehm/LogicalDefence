package za.co.lukestonehm.logicaldefence

import android.content.Context
import android.content.SharedPreferences
import android.content.SharedPreferences.Editor
import android.preference.PreferenceManager

/**
 * Created by luke on 2015/03/21.
 * Used to save a few settings here and there
 */
class AppPreferences(c: Context) {
    private var _generalPrefs: SharedPreferences = PreferenceManager
            .getDefaultSharedPreferences(c)
    private var _generalPrefsEditor: Editor
    var section: Int
        get() = _generalPrefs.getInt(KEY_PREFS_SELECTED_SECTION, 0)
        set(section) {
            _generalPrefsEditor.putInt(KEY_PREFS_SELECTED_SECTION, section)
            _generalPrefsEditor.apply()
        }

    //if -1, has not been set, do not attempt to change the locale
    var locale: Int
        get() =//if -1, has not been set, do not attempt to change the locale
            _generalPrefs.getInt(KEY_PREFS_SELECTED_LOCALE, -1)
        set(which) {
            _generalPrefsEditor.putInt(KEY_PREFS_SELECTED_LOCALE, which)
            _generalPrefsEditor.commit()
        }

    companion object {
        const val KEY_PREFS_SELECTED_SECTION = "selected_section"
        const val KEY_PREFS_SELECTED_LOCALE = "selected_locale"
    }

    init {
        _generalPrefsEditor = _generalPrefs.edit()
        _generalPrefsEditor.apply()
    }
}