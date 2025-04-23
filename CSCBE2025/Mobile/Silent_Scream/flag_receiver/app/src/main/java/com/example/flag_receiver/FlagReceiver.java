package com.example.flag_receiver;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.util.Log;
import android.widget.Toast;

public class FlagReceiver extends BroadcastReceiver {
    @Override
    public void onReceive(Context context, Intent intent) {
        // Check if the action matches the expected broadcast action
        if ("be.cscbe.scream.SENDING_FLAG".equals(intent.getAction())) {
            // Retrieve the flag from the intent's extras
            String flag = intent.getStringExtra("flag");
            if (flag != null) {
                // Do something with the flag, like logging it or displaying it
                Log.d("FlagReceiver", "Received flag: " + flag);
                // Optionally, you could show it in a Toast or save it
                Toast.makeText(context, "Flag: " + flag, Toast.LENGTH_LONG).show();
            }
        }
    }
}