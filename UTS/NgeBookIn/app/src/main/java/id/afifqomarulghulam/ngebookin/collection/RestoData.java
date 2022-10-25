package id.afifqomarulghulam.ngebookin.collection;

import java.util.ArrayList;

import id.afifqomarulghulam.ngebookin.R;
import id.afifqomarulghulam.ngebookin.models.Resto;

public class RestoData {

    private static String[] name = {
            "Warung Pak Dadang",
            "Warung Bu Thayib",
            "Pujasera Agung",
            "Kedai Kopi Mbokti",
            "Sejam saja Kopi",
            "Vintage Foodcourt",
            "Alamia Resto"
    };

    private static int[] image = {
            R.drawable.img1,
            R.drawable.img2,
            R.drawable.img3,
            R.drawable.img4,
            R.drawable.img5,
            R.drawable.img6,
            R.drawable.img7
    };

    private static String[] address = {
            "Jl. Sekupang, No 77",
            "Jl. Ranu Pane, No 83 A",
            "Jl. Panderman, Kav 4",
            "Grand Patria land Blok G7",
            "Perumnas Blok AB No 4",
            "Jl. Kolonel Sugiono",
            "Jl. H. Agus Salim"
    };

    private static String[] status = {
            "Buka",
            "Buka",
            "Buka",
            "Buka",
            "Closed",
            "Closed",
            "Buka",
    };

    private static String[] hour = {
            "6AM - 18.00PM",
            "6AM - 18.00PM",
            "6AM - 18.00PM",
            "13.00PM - 18.00PM",
            "9AM - 18.00PM",
            "10AM - 18.00PM",
            "11AM - 18.00PM",
    };

    public static ArrayList<Resto> getRestoArrayList () {
     ArrayList<Resto> restoArrayList = new ArrayList<>();

     for (int pos=0; pos < name.length; pos++) {
         Resto resto = new Resto();
         resto.setName(name[pos]);
         resto.setImage(image[pos]);
         resto.setAddress(address[pos]);
         resto.setStatus(status[pos]);
         resto.setHour(hour[pos]);
         restoArrayList.add(resto);
     }
     return restoArrayList;
    }

}
