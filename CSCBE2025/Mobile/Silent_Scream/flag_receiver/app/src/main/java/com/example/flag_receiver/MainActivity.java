package com.example.flag_receiver;

import android.annotation.SuppressLint;
import android.content.IntentFilter;
import android.os.Bundle;

import androidx.activity.EdgeToEdge;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;

public class MainActivity extends AppCompatActivity {
    private FlagReceiver receiver;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        EdgeToEdge.enable(this);
        setContentView(R.layout.activity_main);
        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main), (v, insets) -> {
            Insets systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars());
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom);
            return insets;
        });
    }

    @SuppressLint("UnspecifiedRegisterReceiverFlag")
    @Override
    protected void onStart() {
        super.onStart();
        // Register the receiver to listen for the broadcast
        IntentFilter filter = new IntentFilter("be.cscbe.scream.SENDING_FLAG");
        receiver = new FlagReceiver();
        registerReceiver(receiver, filter);
    }

    @Override
    protected void onStop() {
        super.onStop();
        // Unregister the receiver to avoid memory leaks
        unregisterReceiver(receiver);
    }
}