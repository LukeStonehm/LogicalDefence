package za.co.lukestonehm.logicaldefence;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import java.util.List;

/**
 * custom adapter to display the fallacies
 */
public class FallacyListAdapter extends RecyclerView.Adapter<FallacyListAdapter.ViewHolder> {

    private Context c;
    private List<Fallacy> fallaciesItems;

    public static class ViewHolder extends RecyclerView.ViewHolder {
        TextView title, desc, example;
        Fallacy f;

        public ViewHolder(View v) {
            super(v);

            title = (TextView) v.findViewById(R.id.fallacy_title);
            desc = (TextView) v.findViewById(R.id.fallacy_desc);
            example = (TextView) v.findViewById(R.id.fallacy_example);
        }

        public void bindFallacy(Fallacy fallacy) {
            f = fallacy;
            title.setText(f.getTitle());
            desc.setText(f.getDesc());
            example.setText(f.getExample());
        }
    }

    public FallacyListAdapter(Context c, List<Fallacy> items) {
        this.c = c;
        this.fallaciesItems = items;
    }


    @Override
    public FallacyListAdapter.ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(parent.getContext()).inflate(R.layout.list_item, parent, false);
        return new ViewHolder(view);
    }

    @Override
    public void onBindViewHolder(FallacyListAdapter.ViewHolder holder, int position) {
        holder.bindFallacy(fallaciesItems.get(position));
    }

    @Override
    public int getItemCount() {
        return fallaciesItems.size();
    }
}
