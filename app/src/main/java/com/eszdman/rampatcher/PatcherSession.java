package com.eszdman.rampatcher;

import android.util.Log;

public class PatcherSession {
    public static PatcherSession patcherSession;
    private static final String TAG = "PatcherSession";
    PatcherAddreses addreses;
    public PatcherSession() {
        patcherSession = this;
        System.loadLibrary("rampatcher");
        ReadyToPatch(addreses.libName);
        addreses = new PatcherAddreses(getLibraryOffset(addreses.exportName));
        PatchAll(new PatchParameters());
        PatchDone();
    }
    public void PatchAll(PatchParameters patchParameters){
        Log.d(TAG,"sharpening "+readRegionRight(addreses.sharpeningAddres,4));
        setBytes(addreses.sharpeningAddres,patchParameters.sharpeningValue);
        Log.d(TAG,"after patch sharpening "+readRegionRight(addreses.sharpeningAddres,4));

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
    private native void test();
}
