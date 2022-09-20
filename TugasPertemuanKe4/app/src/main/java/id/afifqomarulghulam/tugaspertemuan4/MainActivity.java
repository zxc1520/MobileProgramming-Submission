package id.afifqomarulghulam.tugaspertemuan4;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.os.Bundle;

import java.util.ArrayList;
import java.util.List;

import id.afifqomarulghulam.tugaspertemuan4.adapter.CustomerAdapter;
import id.afifqomarulghulam.tugaspertemuan4.adapter.FeedsAdapter;
import id.afifqomarulghulam.tugaspertemuan4.models.Customer;
import id.afifqomarulghulam.tugaspertemuan4.models.Feeds;

public class MainActivity extends AppCompatActivity {

    RecyclerView recyclerView, rvFeeds;

    CustomerAdapter customerAdapter;
    FeedsAdapter feedsAdapter;

    RecyclerView.LayoutManager layoutManager;
    Customer customer;

    ArrayList<Customer> list = new ArrayList<>();
    List<Feeds> feedsList = new ArrayList<>();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        recyclerView = findViewById(R.id.rvCustomer);
        rvFeeds = findViewById(R.id.rvFeeds);

        list.add(new Customer(
                "Bagus Andriawan",
                "012346543",
                "https://cdn4.iconfinder.com/data/icons/famous-characters-add-on-vol-1-flat/48/Famous_Character_-_Add_On_1-14-512.png"));

        list.add(new Customer(
                "Adam Husain",
                "012341239",
                "https://cdn4.iconfinder.com/data/icons/famous-characters-add-on-vol-1-flat/48/Famous_Character_-_Add_On_1-22-512.png"
        ));

        list.add(new Customer(
                "Maria Kristanto",
                "012346750",
                "https://cdn4.iconfinder.com/data/icons/famous-characters-add-on-vol-1-flat/48/Famous_Character_-_Add_On_1-21-512.png"
        ));

        list.add(new Customer(
                "Kevin Waskita",
                "012345412",
                "https://cdn4.iconfinder.com/data/icons/famous-characters-add-on-vol-1-flat/48/Famous_Character_-_Add_On_1-26-512.png"
        ));

        feedsList.add(new Feeds("Welcome!", "You make me smile when you've reached", "https://cdn4.iconfinder.com/data/icons/famous-characters-add-on-vol-1-flat/48/Famous_Character_-_Add_On_1-14-512.png"));
        feedsList.add(new Feeds("Bienvenue!", "Tu me fais sourire quand tu as atteint", "https://cdn4.iconfinder.com/data/icons/famous-characters-add-on-vol-1-flat/48/Famous_Character_-_Add_On_1-22-512.png"));
        feedsList.add(new Feeds("Willkommen!", "Du bringst mich zum Lächeln wenn du angekommen bist", "https://cdn4.iconfinder.com/data/icons/famous-characters-add-on-vol-1-flat/48/Famous_Character_-_Add_On_1-21-512.png"));
        feedsList.add(new Feeds("Bienvenidos!", "Me haces sonreír cuando has llegado", "https://cdn4.iconfinder.com/data/icons/famous-characters-add-on-vol-1-flat/48/Famous_Character_-_Add_On_1-26-512.png"));

        showCustList();
        showFeedsList();
    }

    public void showCustList() {
        customerAdapter = new CustomerAdapter(list);
        recyclerView.setLayoutManager(new LinearLayoutManager(this));
        recyclerView.setAdapter(customerAdapter);
    }

    public void showFeedsList() {
        feedsAdapter = new FeedsAdapter(feedsList);
        rvFeeds.setLayoutManager(new LinearLayoutManager(this, LinearLayoutManager.HORIZONTAL, false));
        rvFeeds.setAdapter(feedsAdapter);
    }
}