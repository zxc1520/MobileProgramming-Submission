package id.afifqomarulghulam.ngebookin;

import androidx.appcompat.app.AppCompatActivity;

import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;
import android.widget.TextView;

import id.afifqomarulghulam.ngebookin.helper.DatabaseHelper;

public class BookingListDetail extends AppCompatActivity {

    protected Cursor cursor;
    private DatabaseHelper databaseHelper;
    private TextView tx1, tx2, tx3, tx4, tx5;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_booking_list_detail);

        databaseHelper = new DatabaseHelper(this);
        tx1 = findViewById(R.id.txResto);
        tx2 = findViewById(R.id.txtDetailTable);
        tx3 = findViewById(R.id.txtDetailType);
        tx4 = findViewById(R.id.txtDetailQty);
        tx5 = findViewById(R.id.txtDetailId);
        SQLiteDatabase database = databaseHelper.getReadableDatabase();
        cursor = database.rawQuery("SELECT * FROM order_table WHERE warung ='" +
                getIntent().getStringExtra("warung") + "'", null);
        cursor.moveToFirst();
        if (cursor.getCount() > 0) {
            cursor.moveToPosition(0);
            tx1.setText(cursor.getString(0).toString());
            tx2.setText(cursor.getString(1).toString());
            tx3.setText(cursor.getString(2).toString());
            tx4.setText(cursor.getString(3).toString());
            tx5.setText(cursor.getString(4).toString());
        }
    }
}