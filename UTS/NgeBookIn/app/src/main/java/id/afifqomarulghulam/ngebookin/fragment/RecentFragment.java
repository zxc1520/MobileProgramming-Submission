package id.afifqomarulghulam.ngebookin.fragment;

import android.content.DialogInterface;
import android.content.Intent;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;

import androidx.appcompat.app.AlertDialog;
import androidx.fragment.app.Fragment;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.Toast;

import java.util.ArrayList;

import id.afifqomarulghulam.ngebookin.BookingListDetail;
import id.afifqomarulghulam.ngebookin.R;
import id.afifqomarulghulam.ngebookin.adapter.BookingAdapter;
import id.afifqomarulghulam.ngebookin.helper.DatabaseHelper;

/**
 * A simple {@link Fragment} subclass.
 * Use the {@link RecentFragment
 * #newInstance} factory method to
 * create an instance of this fragment.
 */
public class RecentFragment extends Fragment {

    private String[] list;
    private ListView listView;
    protected Cursor cursor;
    private DatabaseHelper databaseHelper;


    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {

       View view = inflater.inflate(R.layout.fragment_recent, container, false);

       listView = view.findViewById(R.id.lv1);

        databaseHelper = new DatabaseHelper(container.getContext());
        refreshList();
        // Inflate the layout for this fragment
        return view;
    }

    private void refreshList() {
        SQLiteDatabase sqLiteDatabase = databaseHelper.getReadableDatabase();
        cursor = sqLiteDatabase.rawQuery("SELECT * FROM order_table", null);
        list = new String[cursor.getCount()];
        cursor.moveToNext();
        for (int i=0; i < cursor.getCount(); i++) {
            cursor.moveToPosition(i);
            list[i] = cursor.getString(1).toString();
        }

        listView.setAdapter(new BookingAdapter(list, getContext()));
        listView.setSelected(true);
        listView.setOnItemClickListener(new AdapterView.OnItemClickListener(){

            public void onItemClick(AdapterView arg0, View arg1, int arg2, long arg3){
                final String selection = list[arg2];
                final CharSequence[] dialogitem = {"See Order"};
                AlertDialog.Builder builder = new AlertDialog.Builder(getContext());
                builder.setTitle("Pilihan");
                builder.setItems(dialogitem, new DialogInterface.OnClickListener(){
                    public void onClick(DialogInterface dialog, int item){
                        switch (item){
                            case 0 :
                                Intent i = new Intent(getContext(), BookingListDetail.class);
                                i.putExtra("warung", selection);
                                startActivity(i);
                                break;
                        }
                    }
                });
                builder.create().show();
            }
        });
        ((ArrayAdapter)listView.getAdapter()).notifyDataSetInvalidated();
    }
}