package com.eszdman.rampatcher;

import android.annotation.SuppressLint;
import android.app.Application;
import android.content.Context;
import android.util.Log;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Properties;

public class PatcherAddreses {
    String libName;
    String exportName;
    long exportAddres;
    long libStartAddres;

    long sharpeningAddres;

    Properties properties;
    PatcherAddreses(long memoryPointer){
        libStartAddres = memoryPointer;
        properties = new Properties();
        Context context = getApplicationUsingReflection();
        try {
            properties.load(context.getResources().openRawResource(R.raw.rampatcher));
        } catch (IOException e) {
            Log.e("PatcherAddreses","Error at loading properties");
            e.printStackTrace();
        }
        libName = properties.getProperty("libName");
        exportName = properties.getProperty("exportName");

        exportAddres = ReadAddr("exportAddres");
        sharpeningAddres = ReadAddr("sharpeningAddres");
    }
    private long ReadAddr(String propertyName){
        return Long.parseLong(propertyName)+libStartAddres;
    }
    @SuppressLint("PrivateApi")
    public static Application getApplicationUsingReflection() {
        try {
            return (Application) Class.forName("android.app.AppGlobals")
                    .getMethod("getInitialApplication").invoke(null, (Object[]) null);
        } catch (IllegalAccessException | InvocationTargetException | NoSuchMethodException | ClassNotFoundException e) {
            Log.e("PatcherAddreses","Error at getting application context");
            e.printStackTrace();
        }
        return null;
    }
}
