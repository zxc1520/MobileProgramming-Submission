package id.afifqomarulghulam.ngebookin.fragment;

import android.os.Bundle;

import androidx.fragment.app.Fragment;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import id.afifqomarulghulam.ngebookin.R;

/**
 * A simple {@link Fragment} subclass.
 * Use the {@link AccountFragment
 * #newInstance} factory method to
 * create an instance of this fragment.
 */
public class AccountFragment extends Fragment {

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment
        return inflater.inflate(R.layout.fragment_account, container, false);
    }
}