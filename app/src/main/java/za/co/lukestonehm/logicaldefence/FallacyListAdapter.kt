package za.co.lukestonehm.logicaldefence

import android.content.Context
import android.content.Intent
import android.view.LayoutInflater
import android.view.View
import android.view.View.OnLongClickListener
import android.view.ViewGroup
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView

/**
 * custom adapter to display the fallacies
 */
class FallacyListAdapter(var c: Context, private val fallaciesItems: List<Fallacy>) : RecyclerView.Adapter<FallacyListAdapter.ViewHolder>() {

    class ViewHolder(v: View) : RecyclerView.ViewHolder(v), OnLongClickListener {
        var title: TextView
        var desc: TextView
        var example: TextView
        var f: Fallacy? = null
        var c: Context? = null
        fun bindFallacy(fallacy: Fallacy?, context: Context?) {
            f = fallacy
            title.text = f!!.title
            desc.text = f!!.desc
            example.text = f!!.example
            c = context
        }

        override fun onLongClick(view: View): Boolean {
            val shareBody = f!!.shareString + c!!.getString(R.string.from)
            val sharingIntent = Intent(Intent.ACTION_SEND)
            sharingIntent.type = "text/plain"
            sharingIntent.putExtra(Intent.EXTRA_TEXT, shareBody)
            c!!.startActivity(Intent.createChooser(sharingIntent, c!!.getString(R.string.share)))
            return false
        }

        init {
            v.setOnLongClickListener(this)
            title = v.findViewById<View>(R.id.fallacy_title) as TextView
            desc = v.findViewById<View>(R.id.fallacy_desc) as TextView
            example = v.findViewById<View>(R.id.fallacy_example) as TextView
        }
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
        val view = LayoutInflater.from(parent.context).inflate(R.layout.list_item, parent, false)
        return ViewHolder(view)
    }

    override fun onBindViewHolder(holder: ViewHolder, position: Int) {
        holder.bindFallacy(fallaciesItems[position], c)
    }

    override fun getItemCount(): Int {
        return fallaciesItems.size
    }

}