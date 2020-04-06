package za.co.lukestonehm.logicaldefence

import android.os.Bundle
import android.view.View
import androidx.appcompat.app.AppCompatActivity
import androidx.appcompat.widget.Toolbar

class About : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_about)
        val mActionBar = findViewById<View>(R.id.action_bar) as Toolbar
        setSupportActionBar(mActionBar)
        supportActionBar!!.setDisplayHomeAsUpEnabled(true)
    }
}