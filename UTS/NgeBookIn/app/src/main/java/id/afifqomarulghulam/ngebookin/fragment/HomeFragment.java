package id.afifqomarulghulam.ngebookin.fragment;

import android.os.Bundle;

import androidx.fragment.app.Fragment;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.SearchView;
import android.widget.TextView;
import android.widget.Toast;

import java.util.ArrayList;

import id.afifqomarulghulam.ngebookin.R;
import id.afifqomarulghulam.ngebookin.adapter.RestoAdapter;
import id.afifqomarulghulam.ngebookin.collection.RestoData;
import id.afifqomarulghulam.ngebookin.models.Resto;

/**
 * A simple {@link Fragment} subclass.
 * Use the {@link HomeFragment#
 * newInstance} factory method to
 * create an instance of this fragment.
 */
public class HomeFragment extends Fragment {

    RecyclerView recyclerView;
    ArrayList<Resto> restoArrayList = new ArrayList<>();

    private SearchView txtSearch;

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fragment_home, container, false);

        // resto lists
        recyclerView = view.findViewById(R.id.rvResto);
        recyclerView.setHasFixedSize(true);
        recyclerView.setLayoutManager(new LinearLayoutManager(view.getContext()));
        recyclerView.setAdapter(new RestoAdapter(restoArrayList));

        restoArrayList.addAll(RestoData.getRestoArrayList());

        txtSearch = view.findViewById(R.id.txtSearch);
        txtSearch.setOnQueryTextListener(new SearchView.OnQueryTextListener() {
            @Override
            public boolean onQueryTextSubmit(String s) {
                return false;
            }

            @Override
            public boolean onQueryTextChange(String s1) {
                filter(s1);
                return false;
            }
        });
        // Inflate the layout for this fragment
        return view;
    }

    private void filter(String text) {
        ArrayList<Resto> arrayList = new ArrayList<Resto>();

        for (Resto resto : restoArrayList) {
            if (resto.getName().toLowerCase().contains(text.toLowerCase())) {
                arrayList.add(resto);
            }
        }

        if (arrayList.isEmpty()) {
            Toast.makeText(getContext(), "No Resto Found !", Toast.LENGTH_SHORT).show();
        } else {
            new RestoAdapter(restoArrayList).filterList(arrayList);
        }
    }
}