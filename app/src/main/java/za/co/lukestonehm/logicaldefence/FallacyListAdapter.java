package za.co.lukestonehm.logicaldefence;

import android.content.Context;
import android.content.Intent;
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

    private List<Fallacy> fallaciesItems;
    Context c;

    public static class ViewHolder extends RecyclerView.ViewHolder implements View.OnLongClickListener {
        TextView title, desc, example;
        Fallacy f;
        Context c;

        public ViewHolder(View v) {
            super(v);

            v.setOnLongClickListener(this);

            title = (TextView) v.findViewById(R.id.fallacy_title);
            desc = (TextView) v.findViewById(R.id.fallacy_desc);
            example = (TextView) v.findViewById(R.id.fallacy_example);
        }

        public void bindFallacy(Fallacy fallacy, Context context) {
            f = fallacy;
            title.setText(f.getTitle());
            desc.setText(f.getDesc());
            example.setText(f.getExample());
            c = context;
        }

        @Override
        public boolean onLongClick(View view) {
            String shareBody = f.getShareString() + c.getString(R.string.from);
            Intent sharingIntent = new Intent(android.content.Intent.ACTION_SEND);
            sharingIntent.setType("text/plain");
            sharingIntent.putExtra(android.content.Intent.EXTRA_TEXT, shareBody);
            c.startActivity(Intent.createChooser(sharingIntent, c.getString(R.string.share)));

            return false;
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
        holder.bindFallacy(fallaciesItems.get(position), c);
    }

    @Override
    public int getItemCount() {
        return fallaciesItems.size();
    }
}
