package id.afifqomarulghulam.ngebookin.adapter;

import android.content.Intent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.squareup.picasso.Picasso;

import java.util.ArrayList;

import id.afifqomarulghulam.ngebookin.DetailActivity;
import id.afifqomarulghulam.ngebookin.R;
import id.afifqomarulghulam.ngebookin.models.Resto;

public class RestoAdapter extends RecyclerView.Adapter<RestoAdapter.ViewHolder> {

    private ArrayList<Resto> arrayList;

    public RestoAdapter(ArrayList<Resto> arrayList) {
        this.arrayList = arrayList;
    }

    @NonNull
    @Override
    public RestoAdapter.ViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(parent.getContext())
                .inflate(R.layout.resto_list_item, parent, false);
        return new ViewHolder(view);
    }

    @Override
    public void onBindViewHolder(@NonNull RestoAdapter.ViewHolder holder, int position) {
        Resto resto = arrayList.get(position);
        holder.txtName.setText(resto.getName());
        holder.txtAddress.setText(resto.getAddress());
        holder.txtStatus.setText(resto.getStatus());
        holder.txtHours.setText(resto.getHour());
        Picasso.get()
                .load(resto.getImage())
                .placeholder(R.drawable.ic_launcher_background)
                .into(holder.imgResto);
        holder.itemView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(view.getContext(), DetailActivity.class);
                intent.putExtra("img", resto.getImage());
                intent.putExtra("name", resto.getName());
                intent.putExtra("address", resto.getAddress());
                view.getContext().startActivity(intent);
            }
        });
    }

    public void filterList(ArrayList<Resto> filterList) {
        arrayList = filterList;

        notifyDataSetChanged();
    }

    @Override
    public int getItemCount() {
        return arrayList.size();
    }

    public class ViewHolder extends RecyclerView.ViewHolder {
        ImageView imgResto;
        TextView txtName, txtAddress, txtStatus, txtHours;
        public ViewHolder(@NonNull View itemView) {
            super(itemView);
            imgResto = itemView.findViewById(R.id.imgItem);
            txtName = itemView.findViewById(R.id.txtName);
            txtAddress = itemView.findViewById(R.id.txtAddress);
            txtStatus = itemView.findViewById(R.id.txtRestoStatus);
            txtHours = itemView.findViewById(R.id.txtRestoHour);
        }
    }
}
