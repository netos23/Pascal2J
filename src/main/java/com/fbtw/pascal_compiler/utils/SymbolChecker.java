package com.fbtw.pascal_compiler.utils;

import java.util.Arrays;

public  class SymbolChecker {
    public static final char[] NUMBERS = {'0','1','2','3','4','5','6','7','8','9'};

    public static boolean isNumber(String s){
        boolean result = true;
        char ch;
        int index;
        for (int i=0;i<s.length();i++){
            ch = s.charAt(i);
            index = Arrays.binarySearch(NUMBERS,ch);
            if(index<0){
                result = false;
                break;
            }
        }
        return result;
    }
}
