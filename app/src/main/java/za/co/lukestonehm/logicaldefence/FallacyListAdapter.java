package za.co.lukestonehm.logicaldefence;

import android.app.Activity;
import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;

import java.util.List;

/**
 * custom adapter to display the fallacies
 */
public class FallacyListAdapter extends BaseAdapter {

    private Context c;
    private List<Fallacy> fallaciesItems;

    public FallacyListAdapter(Context c, List<Fallacy> items) {
        this.c = c;
        this.fallaciesItems = items;
    }

    @Override
    public int getCount() {
        return fallaciesItems.size();
    }

    @Override
    public Object getItem(int i) {
        return fallaciesItems.get(i);
    }

    @Override
    public long getItemId(int i) {
        return fallaciesItems.indexOf(getItem(i));
    }

    @Override
    public View getView(int i, View view, ViewGroup viewGroup) {
        LayoutInflater mInflater = (LayoutInflater)
                c.getSystemService(Activity.LAYOUT_INFLATER_SERVICE);

        if (view == null)
            view = mInflater.inflate(R.layout.list_item, null);

        Fallacy f = fallaciesItems.get(i);

        TextView tv = (TextView) view.findViewById(R.id.fallacy_title);
        tv.setText(f.getTitle());

        tv = (TextView) view.findViewById(R.id.fallacy_desc);
        tv.setText(f.getDesc());

        tv = (TextView) view.findViewById(R.id.fallacy_example);
        tv.setText(f.getExample());


        return view;
    }
}
