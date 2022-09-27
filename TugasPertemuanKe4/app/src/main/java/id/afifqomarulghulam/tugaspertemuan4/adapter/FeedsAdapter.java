package id.afifqomarulghulam.tugaspertemuan4.adapter;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.google.android.material.snackbar.Snackbar;
import com.squareup.picasso.Picasso;

import java.util.List;

import id.afifqomarulghulam.tugaspertemuan4.R;
import id.afifqomarulghulam.tugaspertemuan4.models.Feeds;

public class FeedsAdapter extends RecyclerView.Adapter<FeedsAdapter.MyViewHolder> {

    private List<Feeds> feedsList;

    public FeedsAdapter(List<Feeds> feedsList) {
        this.feedsList = feedsList;
    }

    @NonNull
    @Override
    public MyViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(parent.getContext())
                .inflate(R.layout.item_feeds_list, parent, false);
        return new MyViewHolder(view);
    }

    @Override
    public void onBindViewHolder(@NonNull MyViewHolder holder, int position) {
        Feeds feeds = feedsList.get(position);
        holder.tvTitle.setText(feeds.getTitle());
        holder.tvDesc.setText(feeds.getDesc());

        Picasso.get()
                .load(feeds.getImageUrl())
                .placeholder(R.drawable.ic_launcher_background)
                .into(holder.imageView);

        holder.itemView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Snackbar snackbar = Snackbar.make(view, "Anda memilih " + feeds.getTitle(), Snackbar.LENGTH_LONG);
                snackbar.setAction("Tutup", new View.OnClickListener() {
                    @Override
                    public void onClick(View view) {
                        snackbar.dismiss();
                    }
                });
                snackbar.show();
            }
        });
    }

    @Override
    public int getItemCount() {
        return feedsList.size();
    }

    public class MyViewHolder extends RecyclerView.ViewHolder {

        ImageView imageView;
        TextView tvTitle, tvDesc;

        public MyViewHolder(@NonNull View itemView) {
            super(itemView);
            imageView = itemView.findViewById(R.id.imgFeed);
            tvTitle = itemView.findViewById(R.id.txtTitle);
            tvDesc = itemView.findViewById(R.id.txtDesc);
        }
    }
}
