package id.afifqomarulghulam.recyclerviewsangatsederhana;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.os.Bundle;

import java.util.ArrayList;
import java.util.List;

import id.afifqomarulghulam.recyclerviewsangatsederhana.adapter.SuperHeroAdapter;
import id.afifqomarulghulam.recyclerviewsangatsederhana.models.SuperHero;

public class MainActivity extends AppCompatActivity {

    // Inisiasi
    RecyclerView recyclerView;

    List<SuperHero> listSuperhero = new ArrayList<>();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        recyclerView = findViewById(R.id.item_super_hero);

        // membuat object
        SuperHero superHero = new SuperHero("Petruk");

        listSuperhero.add(superHero);

        superHero = new SuperHero("Gareng");

        listSuperhero.add(superHero);

        SuperHeroAdapter superHeroAdapter = new SuperHeroAdapter(listSuperhero);

        recyclerView.setAdapter(superHeroAdapter);
        recyclerView.setLayoutManager(new LinearLayoutManager(this));
    }
}