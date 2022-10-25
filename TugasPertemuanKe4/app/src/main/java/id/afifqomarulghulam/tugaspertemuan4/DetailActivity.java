package id.afifqomarulghulam.tugaspertemuan4;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.widget.ImageView;
import android.widget.TextView;

import id.afifqomarulghulam.tugaspertemuan4.adapter.CustomerAdapter;

public class DetailActivity extends AppCompatActivity {

    ImageView imageView;
    TextView tvDetailName, tvDetailPhone;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_detail);

        //TextView
        tvDetailName = (TextView) findViewById(R.id.txtDetailName);
        tvDetailPhone = (TextView) findViewById(R.id.txtDetailPhone);

        //Image view
        imageView = (ImageView) findViewById(R.id.imgDetail);

        loadData();
    }

    private void loadData() {
        tvDetailName.setText(getIntent().getStringExtra("name"));
        tvDetailName.setText(getIntent().getStringExtra("name"));
        tvDetailName.setText(getIntent().getStringExtra("name"));
    }
}