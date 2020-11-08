package com.eszdman.rampatcher;

import com.SDE.GetMenuValues;

public class PatchParameters {
    byte[] sharpeningValue;
    int isoValue;
    byte[] lumaNRValue;
    byte[] chromaLowNRValue;
    byte[] chromaHighNRValue;
    byte[] saturationValue;
    byte[] gammaValue;
    byte[] contrast1Value;
    byte[] contrast2Value;

    boolean wide;
    boolean tele;

    public void FillParameters(){
        //sharpeningValue = String2Byte("0801E8D2");
        sharpeningValue = fromKey("lib_sharpness_key");
        //isoValue = fromKeyInt("lib_iso_key");
        lumaNRValue = fromKey("lib_luma_key");
        chromaLowNRValue = fromKey("lib_chroma_key");
        chromaHighNRValue = fromKey("lib_chroma_key");
        saturationValue = fromKey("lib_saturation_key");

    }

    private static byte[] fromKey(String keyName){
        return String2Byte(GetMenuValues.getString(keyName));
    }
    private static int fromKeyInt(String keyName){
        return Integer.parseInt(GetMenuValues.getString(keyName));
    }
    private static byte[] String2Byte(String in){
        char[] i = in.toCharArray();
        byte[] output = new byte[i.length/2];
        for(int k = 0; k<i.length; k+=2) {
            output[k / 2] += -128;
            String inp = (Character.toString(i[k]) + Character.toString(i[k + 1]));
            output[k / 2] = (byte) (Integer.parseInt(inp, 16));
        }
        return output;
    }
}
