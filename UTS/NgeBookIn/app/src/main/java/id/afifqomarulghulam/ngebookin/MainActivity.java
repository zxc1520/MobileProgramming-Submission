package id.afifqomarulghulam.ngebookin;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.fragment.app.Fragment;

import android.os.Bundle;
import android.view.MenuItem;

import com.google.android.material.bottomnavigation.BottomNavigationView;

import id.afifqomarulghulam.ngebookin.fragment.AccountFragment;
import id.afifqomarulghulam.ngebookin.fragment.HomeFragment;
import id.afifqomarulghulam.ngebookin.fragment.RecentFragment;

public class MainActivity extends AppCompatActivity implements BottomNavigationView.OnNavigationItemSelectedListener {

    BottomNavigationView bottomNavigationView;
    HomeFragment homeFragment = new HomeFragment();
    RecentFragment recentFragment = new RecentFragment();
    AccountFragment accountFragment = new AccountFragment();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        bottomNavigationView = (BottomNavigationView) findViewById(R.id.bottomNav);
        bottomNavigationView.setOnNavigationItemSelectedListener(this);
        bottomNavigationView.setSelectedItemId(R.id.home);
    }

    @Override
    public boolean onNavigationItemSelected(@NonNull MenuItem item) {
        switch (item.getItemId()) {
            case R.id.home:
                getSupportFragmentManager()
                        .beginTransaction()
                        .replace(R.id.frameLayout, homeFragment).commit();
                break;
            case R.id.recent:
                getSupportFragmentManager()
                        .beginTransaction()
                        .replace(R.id.frameLayout, recentFragment).commit();
                break;
            case R.id.acc:
                getSupportFragmentManager()
                        .beginTransaction()
                        .replace(R.id.frameLayout, accountFragment).commit();
                break;
        }
        return false;
    }
}