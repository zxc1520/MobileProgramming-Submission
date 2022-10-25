package id.afifqomarulghulam.ngebookin.adapter;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import id.afifqomarulghulam.ngebookin.R;

public class BookingAdapter extends ArrayAdapter {

    private static final String TAG = "ListItemAdapter";

    public BookingAdapter(String[] arrayList, Context context) {
        super(context, R.layout.resto_list_item, arrayList);

    }

    public static class ViewHolder {
        TextView txtId, txtRestoName, txtTable, txtType, txtQty;
    }

    @NonNull
    @Override
    public View getView(int position, @Nullable View convertView, @NonNull ViewGroup parent) {
        if (convertView == null) {
            convertView = LayoutInflater
                    .from(getContext())
                    .inflate(R.layout.resto_booking_list, parent, false);
        }

        ViewHolder viewHolder = new ViewHolder();
        viewHolder.txtId = convertView.findViewById(R.id.txtIdTable);
        viewHolder.txtRestoName = convertView.findViewById(R.id.txtRestoName);
        viewHolder.txtTable = convertView.findViewById(R.id.txtTable);
        viewHolder.txtType = convertView.findViewById(R.id.txtTableType);
        viewHolder.txtQty = convertView.findViewById(R.id.txtTableQty);

        viewHolder.txtRestoName.setText((CharSequence) getItem(position));
        viewHolder.txtTable.setText((CharSequence) getItem(position));
        convertView.setTag(viewHolder);
        return convertView;
    }
}
