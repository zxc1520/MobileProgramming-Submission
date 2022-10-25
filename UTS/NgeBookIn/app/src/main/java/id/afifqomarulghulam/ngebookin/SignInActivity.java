package id.afifqomarulghulam.ngebookin;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.Toast;

import java.util.Objects;

public class SignInActivity extends AppCompatActivity {

    private SharedPreferences sharedPreferences;

    private static final String USERNAME_KEY = "key_username";
    private static final String KEEP_LOGIN_KEY = "key_keep_login";

    private static final String DUMMY_USERNAME = "user";
    private static final String DUMMY_PASSWORD = "p455w0rd";

    private EditText edtUser, edtPass;
    private CheckBox cbKeep;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_sign_in);

        this.sharedPreferences = this.getSharedPreferences("ngebookin", Context.MODE_PRIVATE);

        this.edtUser = findViewById(R.id.edtUser);
        this.edtPass = findViewById(R.id.edtPass);
        this.cbKeep = findViewById(R.id.chkRemember);

        this.autoLogin();
    }

    public boolean validateCredential() {
        String currentUsername = this.edtUser.getText().toString();
        String currentPassword = this.edtPass.getText().toString();

        return (Objects.equals(currentUsername, DUMMY_USERNAME)
                && Objects.equals(currentPassword, DUMMY_PASSWORD));
    }

    public void onBtnLogin_Click(View view)
    {
        boolean valid = this.validateCredential();

        if(valid)
        {
            Intent i = new Intent(SignInActivity.this, MainActivity.class);
            startActivity(i);

            this.makeAutoLogin();
        }
        else
        {
            Toast.makeText(this, "Invalid username and/or password!", Toast.LENGTH_LONG).show();
        }
    }

    private void makeAutoLogin() {

        SharedPreferences.Editor editor = this.sharedPreferences.edit();

        if (this.cbKeep.isChecked())
            editor.putBoolean(KEEP_LOGIN_KEY, true);
        else
            editor.remove(KEEP_LOGIN_KEY);

        editor.apply();
    }

    public void autoLogin() {

        boolean keepLogin = this.sharedPreferences.getBoolean(KEEP_LOGIN_KEY, false);

        if (keepLogin) {
            Intent intent = new Intent(SignInActivity.this, MainActivity.class);
            startActivity(intent);
        }

    }
}