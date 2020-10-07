package com.fbtw.pascal_compiler.core.data_types.memory_core;

public class StringMemoryCell extends MemoryCell{
    private String[] strings; //8
    private String[][] stringsMas1; //9
    private String[][][] stringsMas2; //10
    private String[] stringsConst; //11

    protected StringMemoryCell(String[] names, boolean[] inits, int[] lengths) {
        super(names, inits, lengths);
    }

    @Override
    public boolean containsName(String src) {
        return false;
    }

    @Override
    public Object getValueByName(String src) {
        return null;
    }

    @Override
    public Object getValueByIndex(int index) {
        return null;
    }

    @Override
    public Object getValueByAdress(String s) {
        return null;
    }

    @Override
    public Object getValueByAdress(int type, int index) {
        return null;
    }

    @Override
    protected void fill(int[] lengths) {

    }

    @Override
    protected int[] getBoundOfType(int type) {
        return new int[0];
    }

    @Override
    protected int indexOf(String name) {
        return 0;
    }

    @Override
    protected void deFragmentMemory() {

    }
}
