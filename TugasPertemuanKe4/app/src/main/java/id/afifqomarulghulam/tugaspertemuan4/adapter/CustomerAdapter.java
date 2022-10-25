package id.afifqomarulghulam.tugaspertemuan4.adapter;

import android.content.Intent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.google.android.material.snackbar.Snackbar;
import com.squareup.picasso.Picasso;

import java.util.ArrayList;

import id.afifqomarulghulam.tugaspertemuan4.DetailActivity;
import id.afifqomarulghulam.tugaspertemuan4.R;
import id.afifqomarulghulam.tugaspertemuan4.models.Customer;

public class CustomerAdapter extends RecyclerView.Adapter<CustomerAdapter.MyViewHolder> {

    public ArrayList<Customer> arrayList;

    public CustomerAdapter(ArrayList<Customer> arrayList) {
        this.arrayList = arrayList;
    }

    @NonNull
    @Override
    public CustomerAdapter.MyViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View vh = LayoutInflater.from(parent.getContext()).inflate(R.layout.item_cust_list, parent, false);
        return new MyViewHolder(vh);
    }

    @Override
    public void onBindViewHolder(@NonNull CustomerAdapter.MyViewHolder holder, int position) {
        Customer customer = arrayList.get(position);
        holder.tvName.setText(customer.getName());
        holder.tvPhone.setText(customer.getPhone());

        Picasso.get().load(customer.getImageUrl())
                .placeholder(R.drawable.ic_launcher_background)
                .into(holder.photo);

        holder.itemView.setOnClickListener(new View.OnClickListener() {
            String name = customer.getName();
            String phone = customer.getPhone();
            String photo = customer.getImageUrl();

            @Override
            public void onClick(View view) {
                Intent intent = new Intent(view.getContext(), DetailActivity.class);
                intent.putExtra("Key_CustomerActivity", new String[]{name, phone, photo});
                view.getContext().startActivity(intent);
                Toast.makeText(view.getContext(), "Anda Memilih " + customer.getName(), Toast.LENGTH_SHORT).show();
            }
        });

        holder.itemView.setOnLongClickListener(new View.OnLongClickListener() {
            @Override
            public boolean onLongClick(View view) {
                if (view.getId() == holder.itemView.getId()) {
                    arrayList.remove(holder.getAdapterPosition());
                    notifyItemRemoved(holder.getAdapterPosition());
                    notifyItemRangeChanged(holder.getAdapterPosition(), arrayList.size());

                    Snackbar snackbar = Snackbar.make(view, customer.getName() + " has been removed", Snackbar.LENGTH_LONG);

                    snackbar.setAction("UNDO", new View.OnClickListener() {
                        @Override
                        public void onClick(View view) {
                            arrayList.add(new Customer(
                                            customer.getName(),
                                            customer.getPhone(),
                                            customer.getImageUrl()
                                    ));

                                    notifyItemRemoved(holder.getAdapterPosition());
                                    notifyItemRangeChanged(holder.getAdapterPosition(), arrayList.size());
                                }
                    });

                    snackbar.show();
                }
                return true;
            }
        });
    }

    @Override
    public int getItemCount() {
        return arrayList.size();
    }

    public class MyViewHolder extends RecyclerView.ViewHolder {
        ImageView photo;
        TextView tvName, tvPhone;
        public MyViewHolder(@NonNull View itemView) {
            super(itemView);
            photo = itemView.findViewById(R.id.img_item);
            tvName = itemView.findViewById(R.id.txtName);
            tvPhone = itemView.findViewById(R.id.txtPhone);
        }
    }
}
