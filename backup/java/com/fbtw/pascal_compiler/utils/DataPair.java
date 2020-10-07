package com.fbtw.pascal_compiler.utils;

public class DataPair<E> {
    private String name;
    private E value;


    public DataPair(String name, E value) {
        this.name = name;
        this.value = value;

    }

    public String getName() {
        return name;
    }

    public E getValue() {
        return value;
    }


}
