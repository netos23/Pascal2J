package com.fbtw.pascal_compiler.core.memory_core;

import com.fbtw.pascal_compiler.core.memory_core.arrays.SimpleArrayPrimitive;
import com.fbtw.pascal_compiler.utils.DataPair;

import java.util.ArrayList;

public class ArrayMemoryCell extends MemoryCell {

    private SimpleArrayPrimitive[] shortIntArr;//0
    private SimpleArrayPrimitive[] wordArr;//1
    private SimpleArrayPrimitive[] integerArr;//2
    private SimpleArrayPrimitive[] longIntArr;//3
    private SimpleArrayPrimitive[] realArr;//4
    private SimpleArrayPrimitive[] doubleArr;//5
    private SimpleArrayPrimitive[] booleanArr;///6
    private SimpleArrayPrimitive[] charArr;///7
    private SimpleArrayPrimitive[] objectArrs;




    protected ArrayMemoryCell(ArrayList<DataPair<Integer[]>> names, ArrayList<Integer[]> lengths) {
        super(names, lengths);
    }

    @Override
    public Object getValue(Integer[] id) throws Exception {
        return null;
    }

    @Override
    public Integer[] getAdress(String name) {
        return new Integer[0];
    }

    @Override
    void fill(ArrayList<Integer[]> lengths) {

    }
}
