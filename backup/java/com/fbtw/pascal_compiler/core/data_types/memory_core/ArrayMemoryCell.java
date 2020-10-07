package com.fbtw.pascal_compiler.core.data_types.memory_core;

public class ArrayMemoryCell extends MemoryCell {
    public static Object[] DEFOULT_VALUES = {0, 0, 0, 0, 0, 0, 0, 0};

    private byte[][] shortIntMas1; //12     [[3,4],[5,8]],
    private short[][] wordMas1; //13         [[4,5]],
    private int[][] integerMas1; //14        [[0,10],[-1,0],[2,9]]

    private long[][] longIntMas1; //15
    private float[][] realMas1; //16
    private double[][] doubleMas1; //17
    private boolean[][] booleanMas1; //18
    private char[][] charsMas1; //19

    public ArrayMemoryCell(String[] names, boolean[] inits, int[] lengths) {
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
