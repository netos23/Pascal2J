package com.fbtw.pascal_compiler.core.memory_core;

import com.fbtw.pascal_compiler.utils.DataPair;

import java.util.ArrayList;

public class StringMemoryCell extends MemoryCell {


    protected StringMemoryCell(ArrayList<DataPair<Integer[]>> names, ArrayList<Integer[]> lengths) {
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

    public static class StringMemoryBuilder extends CellBuilder{
        @Override
        public CellBuilder parseVars(String vars, String type) {
            return null;
        }

        @Override
        public MemoryCell build() throws Exception {
            return null;
        }

        @Override
        public int getType(String type) throws Exception {
            return 0;
        }

        @Override
        public int getValueType(String strWithValue) throws Exception {
            return 0;
        }

        @Override
        public int getConstType(String strWithValue) throws Exception {
            return 0;
        }

        @Override
        public int getArrayFirstIndex(int type) {
            return 0;
        }
    }

}
