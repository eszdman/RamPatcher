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

    long isoAddres;
    long sharpeningAddres;
    long lumaNRAddres;
    long chromaLowNRAddres;
    long chromaHighNRAddres;
    long saturationAddres;
    long gammaAddres;
    long contrast1Addres;
    long contrast2Addres;



    Properties properties;
    PatcherAddreses(){
        properties = new Properties();
        Context context = getApplicationUsingReflection();
        try {
            properties.load(context.getResources().openRawResource(R.raw.rampatcher80018));
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
        isoAddres = ReadAddr("isoAddres");
        sharpeningAddres = ReadAddr("sharpeningAddres");
        lumaNRAddres = ReadAddr("lumaNRAddres");
        chromaLowNRAddres = ReadAddr("chromaLowNRAddres");
        chromaHighNRAddres = ReadAddr("chromaHighNRAddres");
        saturationAddres = ReadAddr("saturationAddres");
        gammaAddres = ReadAddr("gammaAddres");
        contrast1Addres = ReadAddr("contrast1Addres");
        contrast2Addres = ReadAddr("contrast2Addres");

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
