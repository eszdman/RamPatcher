package com.eszdman.rampatcher;

import com.SDE.GetMenuValues;

public class PatchParameters {
    byte[] sharpeningValue;

    public void FillParameters(){
        //sharpeningValue = String2Byte("0801E8D2");
        sharpeningValue = fromKey("lib_sharpness_key");
        
    }

    private static byte[] fromKey(String keyName){
        return String2Byte(GetMenuValues.getString(keyName));
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
