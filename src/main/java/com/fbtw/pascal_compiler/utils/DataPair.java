package com.fbtw.pascal_compiler.utils;

import java.util.Comparator;

public class DataPair<E > implements Comparable<DataPair>{
    private String name;
    private E value;


    public DataPair(String name, E value) {
        this.name = name;
        this.value = value;



    }

    DataPair(String name){
        this.name = name;


    }

    public String getName() {
        return name;
    }

    public E getValue() {
        return value;
    }

    public void setValue(E value){

        this.value = value;
    }

    void setName(String name) {
        this.name = name;
    }

    @Override
    public int compareTo(DataPair o) {
        return name.compareTo(o.name);
    }

    public static class SearchDataPairItem extends DataPair{


        public SearchDataPairItem(String name) {
            super(name);
        }

        public void updateName(String name){
            setName(name);
        }
    }
}
