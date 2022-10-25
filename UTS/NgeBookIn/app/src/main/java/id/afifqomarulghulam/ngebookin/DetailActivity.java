package id.afifqomarulghulam.ngebookin;

import androidx.appcompat.app.AppCompatActivity;

import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;

import id.afifqomarulghulam.ngebookin.helper.DatabaseHelper;

public class DetailActivity extends AppCompatActivity {

    private ImageView imgDetail;
    private TextView tvDetailName, tvDetailAddress;
    private Spinner spinnerTable, spinnerQty;
    private RadioGroup radioGroup;
    private RadioButton radioButton;
    private Button button;

    private DatabaseHelper databaseHelper;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_detail);

        databaseHelper = new DatabaseHelper(this);
        spinnerTable = findViewById(R.id.spnTable);
        spinnerQty = findViewById(R.id.spnTableQty);
        radioGroup = findViewById(R.id.radioOption);

        button = findViewById(R.id.btnSubmit);

        ArrayAdapter<CharSequence> adapter = ArrayAdapter
                .createFromResource(this, R.array.item_list_table, android.R.layout.simple_spinner_item);
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        spinnerTable.setAdapter(adapter);

        radioGroup.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                int selected = radioGroup.getCheckedRadioButtonId();
                if (selected != -1) {
                    radioButton = findViewById(selected);
                    String selectRbText = radioButton.getText().toString();
                    Toast.makeText(getApplicationContext(), selectRbText, Toast.LENGTH_SHORT).show();
                } else {
                    Toast.makeText(getApplicationContext(), "Nothing", Toast.LENGTH_SHORT).show();
                }
            }
        });

        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                SQLiteDatabase sqLiteDatabase = databaseHelper.getWritableDatabase();
                String sql = "INSERT INTO order_table (warung, table_cat, table_type, table_qty) values ('" +
                        tvDetailName.getText().toString() + "','" +
                        spinnerTable.getSelectedItem().toString() + "','" +
                        radioGroup.toString() + "','" +
                        spinnerQty.getSelectedItem().toString() + "')";
                sqLiteDatabase.execSQL(sql);
                finish();

                pushToast("Berhasil disimpan !");
            }
        });

        catchData();
    }

    private void pushToast(String msg) {
        Toast.makeText(DetailActivity.this, msg, Toast.LENGTH_SHORT).show();
    }

    private void catchData() {
        imgDetail = findViewById(R.id.detailImage);
        tvDetailName = findViewById(R.id.detailName);
        tvDetailAddress = findViewById(R.id.detailAddress);

        imgDetail.setImageResource(getIntent().getIntExtra("img", 0));
        tvDetailName.setText(getIntent().getStringExtra("name"));
        tvDetailAddress.setText(getIntent().getStringExtra("address"));
    }
}