package com.fbtw.pascal_compiler.core.memory_core;

import com.fbtw.pascal_compiler.utils.DataPair;

import java.util.ArrayList;
import java.util.Arrays;

public abstract class CellBuilder {
   protected ArrayList<DataPair<Integer[]>> names;

    int [] countValues;
    protected Integer [] lengths;
    protected ArrayList<DataPair<String>> valuesForInit;

    public CellBuilder(){
        names = new ArrayList<>();
        valuesForInit = new ArrayList<>();

        lengths = new Integer[8];
        Arrays.fill(lengths,0);
    }

    public abstract CellBuilder parseVars(String vars, String type);

    public abstract MemoryCell build()throws Exception;

    public abstract int getType(String type) throws Exception;

    public abstract int getValueType(String strWithValue)throws Exception;

    public abstract int getConstType(String strWithValue) throws Exception;

    public abstract int getArrayFirstIndex(int type);



}
