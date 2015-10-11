package za.co.lukestonehm.logicaldefence;

import android.content.Context;
import android.content.SharedPreferences;
import android.preference.PreferenceManager;

/**
 * Created by luke on 2015/03/21.
 * Used to save a few settings here and there
 */
public class AppPreferences {
    public static final String KEY_PREFS_SELECTED_SECTION = "selected_section";
    public static final String KEY_PREFS_SELECTED_LOCALE = "selected_locale";

    SharedPreferences _generalPrefs;
    SharedPreferences.Editor _generalPrefsEditor;

    Context c;

    public AppPreferences(Context c) {
        this.c = c;

        this._generalPrefs = PreferenceManager
                .getDefaultSharedPreferences(c);
        this._generalPrefsEditor = _generalPrefs.edit();
        _generalPrefsEditor.apply();
    }

    public int getSection() {
        return _generalPrefs.getInt(KEY_PREFS_SELECTED_SECTION, 0);
    }

    public void setSection(int section) {
        _generalPrefsEditor.putInt(KEY_PREFS_SELECTED_SECTION, section);
        _generalPrefsEditor.apply();
    }

    public int getLocale() {
        //if -1, has not been set, do not attempt to change the locale
        return _generalPrefs.getInt(KEY_PREFS_SELECTED_LOCALE, -1);
    }

    public void setLocale(int which) {
        _generalPrefsEditor.putInt(KEY_PREFS_SELECTED_LOCALE, which);
        _generalPrefsEditor.commit();
    }
}
