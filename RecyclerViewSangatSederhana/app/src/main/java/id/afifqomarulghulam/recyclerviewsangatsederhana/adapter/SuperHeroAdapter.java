package id.afifqomarulghulam.recyclerviewsangatsederhana.adapter;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import java.util.List;

import id.afifqomarulghulam.recyclerviewsangatsederhana.R;
import id.afifqomarulghulam.recyclerviewsangatsederhana.models.SuperHero;

public class SuperHeroAdapter extends RecyclerView.Adapter<SuperHeroAdapter.MyViewHolder> {

    List<SuperHero> heroList;

    public SuperHeroAdapter(List<SuperHero> heroList) {
        this.heroList = heroList;
    }

    @NonNull
    @Override
    public MyViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        Context context = parent.getContext();
        //
        LayoutInflater layoutInflater = LayoutInflater.from(context);
        //
        View superHeroView = layoutInflater.inflate(R.layout.item_layout, parent, false);
        //
        MyViewHolder viewHolder = new MyViewHolder(superHeroView);

        return viewHolder;
    }

    @Override
    public void onBindViewHolder(@NonNull MyViewHolder holder, int position) {
        SuperHero superHero = heroList.get(position);

        holder.txtHeroName.setText(superHero.getHeroName());
    }

    @Override
    public int getItemCount() {
        return heroList.size();
    }

    public class MyViewHolder extends RecyclerView.ViewHolder {
        public TextView txtHeroName;

        public MyViewHolder(@NonNull View itemView) {
            super(itemView);

            txtHeroName = itemView.findViewById(R.id.heroName);
        }
    }
}
