package com.eszdman.rampatcher;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        System.loadLibrary("gcastartup");
        PatcherSession patcherSession = new PatcherSession();
        // Example of a call to a native method
        TextView tv = findViewById(R.id.sample_text);
    }
}