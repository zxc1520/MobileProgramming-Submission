package id.afifqomarulghulam.ngebookin.adapter;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import java.util.ArrayList;
import id.afifqomarulghulam.ngebookin.R;

public class BooklistAdapter extends RecyclerView.Adapter<BooklistAdapter.ViewHolder> {

    private ArrayList idList;
    private ArrayList nameList;
    private ArrayList tableList;
    private ArrayList typeList;
    private ArrayList qtyList;

    public BooklistAdapter(ArrayList idList, ArrayList nameList, ArrayList tableList, ArrayList typeList, ArrayList qtyList) {
        this.idList = idList;
        this.nameList = nameList;
        this.tableList = tableList;
        this.typeList = typeList;
        this.qtyList = qtyList;
    }

    @NonNull
    @Override
    public BooklistAdapter.ViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(parent.getContext())
                .inflate(R.layout.resto_booking_list, parent, false);
        return new ViewHolder(view);
    }

    @Override
    public void onBindViewHolder(@NonNull BooklistAdapter.ViewHolder holder, int position) {
        final int id = (int) idList.get(position);
        final String RestoName = (String) nameList.get(position);
        final String Table = (String) tableList.get(position);
        final String TableType = (String) typeList.get(position);
        final String TableQty = (String) qtyList.get(position);

        holder.txtId.setText(id);
        holder.txtName.setText(RestoName);
        holder.txtTable.setText(Table);
        holder.txtType.setText(TableType);
        holder.txtQty.setText(TableQty);
    }

    @Override
    public int getItemCount() {
        return idList.size();
    }

    public class ViewHolder extends RecyclerView.ViewHolder {

        TextView txtId, txtName, txtTable, txtType, txtQty;

        public ViewHolder(@NonNull View itemView) {
            super(itemView);
            txtId = itemView.findViewById(R.id.txtIdTable);
            txtName = itemView.findViewById(R.id.txtRestoName);
            txtTable = itemView.findViewById(R.id.txtTable);
            txtType = itemView.findViewById(R.id.txtTableType);
        }
    }
}
