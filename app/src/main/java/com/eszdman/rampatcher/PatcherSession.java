package com.eszdman.rampatcher;

import android.os.Environment;
import android.os.FileUtils;
import android.util.Log;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.ByteBuffer;

public class PatcherSession {
    public static PatcherSession patcherSession;
    private static final String TAG = "PatcherSession";
    public static final boolean DEBUG = true;
    PatcherAddreses addreses;
    public PatcherSession() {
        System.loadLibrary("rampatcher");
        patcherSession = this;
        addreses = new PatcherAddreses();
        ReadyToPatch(addreses.libName);
        long memoryPointer = getLibraryOffset(addreses.exportName);
        addreses.InsertMemoryAddr(memoryPointer);
        Log.d(TAG,"libname:"+addreses.libName);

        PatchParameters patchParameters = new PatchParameters();
        patchParameters.FillParameters();
        PatchAll(patchParameters);
        PatchDone();
    }
    public void PatchAll(PatchParameters patchParameters){
        patchBytes(addreses.sharpeningAddres,patchParameters.sharpeningValue);
        patchBytes(addreses.chromaHighNRAddres,patchParameters.chromaHighNRValue);
        patchBytes(addreses.chromaLowNRAddres,patchParameters.chromaLowNRValue);
        patchBytes(addreses.lumaNRAddres,patchParameters.lumaNRValue);
        patchBytes(addreses.saturationAddres,patchParameters.saturationValue);
    }
    private void patchBytes(long addr, byte[] in){
        if(in != null && addr != 0) {
            if(DEBUG) Log.d(TAG,"Patch before: "+readRegionRight(addreses.sharpeningAddres,in.length));
            setBytes(addr,in);
            if(DEBUG) Log.d(TAG,"Patch after: "+readRegionRight(addreses.sharpeningAddres,in.length));
        } else {
            if(DEBUG) Log.d(TAG,"NullPtr at:"+addr);
        }
    }
    public void SaveCurrentLib(){
        long librarysize = 0x262E984;
        byte[] library = getBytes(addreses.libStartAddres,librarysize);
        File dir = new File(Environment.getExternalStorageDirectory()+"/gcam");
        if(!dir.exists()) dir.mkdir();
        File outp = new File(Environment.getExternalStorageDirectory()+"/gcam/lib.so");
        if(!outp.exists()) outp.mkdir();
        try (FileOutputStream fos = new FileOutputStream(outp)) {
            fos.write(library);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private native void ReadyToPatch(String libname);
    private native void PatchDone();
    private native String readRegion(long addr,int size);
    private native String readRegionRight(long addr,int size);
    private native long getLibraryOffset(String exportName);
    private native void setBytes(long addr,byte[] in);
    private native void setFloat(long addr,float in);
    private native void setDouble(long addr,double in);
    private native void setInt(long addr,int in);
    private native byte[] getBytes(long addr,long size);
}
