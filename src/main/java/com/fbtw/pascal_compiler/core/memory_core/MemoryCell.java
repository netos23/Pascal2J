package com.fbtw.pascal_compiler.core.memory_core;



import com.fbtw.pascal_compiler.utils.DataPair;

import java.util.*;

public abstract class MemoryCell {

    ArrayList<DataPair<Integer[]>> names;
    DataPair.SearchDataPairItem searchDataPairItem;



    protected  MemoryCell(ArrayList<DataPair<Integer[]>> names, ArrayList<Integer[]> lengths) {
        this.names = names;
        searchDataPairItem = new DataPair.SearchDataPairItem("");
        Collections.sort(names);
        fill(lengths);
    }

    public abstract Object getValue(Integer [] id) throws Exception;
    public abstract Integer[] getAdress(String name);
    abstract void fill(ArrayList<Integer[]> lengths);




}
