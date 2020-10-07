package com.fbtw.pascal_compiler.core.data_types.memory_core;

import com.fbtw.pascal_compiler.utils.DataPair;

import java.util.ArrayList;
import java.util.Arrays;

public abstract class CellBuilder {
    protected StringBuilder[] names;
    protected boolean[] inits;
    protected int [] lengths;
    protected ArrayList<DataPair> valuesForInit;

    public CellBuilder(){
        names = new StringBuilder[8];
        valuesForInit = new ArrayList<>();
        for(int i=0;i<names.length;i++){
            names[i] = new StringBuilder();
        }
        inits = new boolean[8];
        Arrays.fill(inits,false);
        lengths = new int[8];
        Arrays.fill(lengths,0);
    }

    public abstract MemoryCell build()throws Exception;

    public abstract int getType(String type) throws Exception;

    public abstract int getValueType(String strWithValue)throws Exception;

   // protected abstract <E> E toValue(String val,Class<E> type);
}
