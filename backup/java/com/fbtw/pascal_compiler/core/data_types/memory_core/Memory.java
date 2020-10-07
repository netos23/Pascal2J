package com.fbtw.pascal_compiler.core.data_types.memory_core;

import java.lang.reflect.Array;
import java.util.*;

public class Memory {
    /**
     * vars
     **/
    private byte[] shortIntVars; //0
    private short[] wordVars; //1
    private int[] integerVars; //2
    private long[] longIntVars; //3
    private float[] realVars; //4
    private double[] doubleVars; //5
    private boolean[] booleanVars; //6
    private char[] chars; //7

    /**
     * Strings
     **/
    private String[] strings; //8
    private String[][] stringsMas1; //9
    private String[][][] stringsMas2; //10
    private String[] stringsConst; //11


    /**
     * arrays
     **/
    private byte[][] shortIntMas1; //12
    private short[][] wordMas1; //13
    private int[][] integerMas1; //14
    private long[][] longIntMas1; //15
    private float[][] realMas1; //16
    private double[][] doubleMas1; //17
    private boolean[][] booleanMas1; //18
    private char[][] charsMas1; //19



    /**
     * two-dimensional array
     **/
    private byte[][][] shortIntMas2; //20
    private short[][][] wordMas2; //21
    private int[][][] integerMas2; //22
    private long[][][] longIntMas2; //23
    private float[][][] realMas2; //24
    private double[][][] doubleMas2; //25
    private boolean[][][] booleanMas2; //26
    private char[][][] charsMas2; //27



    /**
     * const value
     **/
    private byte[] shortIntConst; //28
    private short[] wordConst; //29
    private int[] integerConst; //30
    private long[] longIntConst; //31
    private float[] realConst; //32
    private double[] doubleConst; //33
    private boolean[] booleanConst; //34
    private char[] charsConst; //35




    /**
     * collections
     **/
    private ArrayList[] lists; //36
    private Set[] sets; //37
    private Map[] maps; //38
    private Deque[] deks; //39
    private Queue [] queues;//40
    private Stack[] stacks;//41


    private String[] namesVar;
    private String[] namesString;
    private String[] namesArray;
    private String[] namesArray2;
    private String[] namesConst;
    private String[] collections;
    private boolean[] initVar;
    private boolean[] initString;
    private boolean[] initArr;
    private boolean[] initArr2;
    private boolean[] initConst;
    private boolean[] initCollections;


    public static class MemoryBuilder{

        private boolean[] initVar;
        private boolean[] initString;
        private boolean[] initArr;
        private boolean[] initArr2;
        private boolean[] initConst;
        private boolean[] initCollections;

        private String[] namesVar;
        private String[] namesString;
        private String[] namesArray;
        private String[] namesArray2;
        private String[] namesConst;
        private String[] collections;

        private int[] lengths;
        private StringBuilder[] names;

        public MemoryBuilder() {
            initVar = new boolean[8];
            initString = new boolean[4];
            initArr = new boolean[8];
            initArr2= new boolean[8];
            initConst= new boolean[8];
            initCollections = new boolean[6];

            lengths = new int[42];
            Arrays.fill(lengths,0);

            names = new StringBuilder[6];
            Arrays.fill(names,new StringBuilder());


        }


        public MemoryBuilder setInts(String src){
            initVar[2] = true;




            return this;
        }
    }

}
