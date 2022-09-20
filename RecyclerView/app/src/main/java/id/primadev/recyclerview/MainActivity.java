package id.primadev.recyclerview;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.View;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.List;

import Models.Contact;


public class MainActivity extends AppCompatActivity implements ContactAdapter.OnContactClickListener {

    public RecyclerView rv;
    public ContactAdapter contactAdapter;
    public RecyclerView.LayoutManager layoutManager;
    public List<Contact> listContact = new ArrayList<>();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        rv = findViewById(R.id.rvContact);

        listContact.add(new Contact("Iron Man",
                "102018308",
                "https://cdn4.iconfinder.com/data/icons/famous-characters-add-on-vol-1-flat/48/Famous_Character_-_Add_On_1-14-512.png"));

        listContact.add(new Contact("Bat Man",
                "102018309",
                "https://cdn4.iconfinder.com/data/icons/famous-characters-add-on-vol-1-flat/48/Famous_Character_-_Add_On_1-22-512.png"));

        listContact.add(new Contact("Groot",
                "102018307",
                "https://cdn4.iconfinder.com/data/icons/famous-characters-add-on-vol-1-flat/48/Famous_Character_-_Add_On_1-21-512.png"));

        listContact.add(new Contact("Sonic",
                "102018301",
                "https://cdn4.iconfinder.com/data/icons/famous-characters-add-on-vol-1-flat/48/Famous_Character_-_Add_On_1-26-512.png"));

        listContact.add(new Contact("Goku",
                "102018303",
                "https://cdn2.iconfinder.com/data/icons/dragonball-z-colored/48/Cartoons__Anime_Dragonball_Artboard_1-256.png"));

        listContact.add(new Contact("Red Ranger",
                "102018309",
                "https://cdn1.iconfinder.com/data/icons/avatars-vol-2/140/_red_power_ranger-256.png"));



        contactAdapter = new ContactAdapter(listContact);
        contactAdapter.setListener(this);
        layoutManager = new LinearLayoutManager(getApplicationContext());
        rv.setAdapter(contactAdapter);
        rv.setLayoutManager(layoutManager);
    }

    @Override
    public void onClick(View view, int position) {
        Contact contact = listContact.get(position);
        Toast.makeText(this, contact.getName(), Toast.LENGTH_LONG)
                .show();
    }
}

