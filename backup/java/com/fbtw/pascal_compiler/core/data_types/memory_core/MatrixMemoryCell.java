package com.fbtw.pascal_compiler.core.data_types.memory_core;

public class MatrixMemoryCell extends MemoryCell{

    private byte[][][] shortIntMas2; //20
    private short[][][] wordMas2; //21
    private int[][][] integerMas2; //22
    private long[][][] longIntMas2; //23
    private float[][][] realMas2; //24
    private double[][][] doubleMas2; //25
    private boolean[][][] booleanMas2; //26
    private char[][][] charsMas2;

    protected MatrixMemoryCell(String[] names, boolean[] inits, int[] lengths) {
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
