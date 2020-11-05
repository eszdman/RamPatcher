package com.eszdman.rampatcher;

import android.annotation.SuppressLint;
import android.app.Application;
import android.content.Context;
import android.util.Log;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Properties;

public class PatcherAddreses {
    private final static String TAG = "PatcherAddreses";
    String libName;
    String exportName;
    long exportAddres;
    long libStartAddres;

    long sharpeningAddres;

    Properties properties;
    PatcherAddreses(){
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
        Log.d(TAG,"exportName:"+exportName);


    }
    public void InsertMemoryAddr(long memoryPointer){
        libStartAddres = memoryPointer;
        exportAddres = ReadLong(properties.getProperty("exportAddres"));
        Log.d(TAG,"exportAddres:"+exportAddres);
        libStartAddres-=exportAddres;
        sharpeningAddres = ReadAddr("sharpeningAddres");
    }
    private long ReadLong(String in){
        if(in.contains("0x")){
            in = in.replace("0x","");
            return Long.parseLong(in,16);
        }
        return Long.parseLong(in);
    }
    private long ReadAddr(String propertyName){
       return ReadLong(properties.getProperty(propertyName))+libStartAddres;
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
