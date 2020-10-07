package com.fbtw.pascal_compiler.core.data_types.memory_core;


import com.fbtw.pascal_compiler.core.machinery.FileLoader;

import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;

public abstract class MemoryCell {
    protected String[] names;
    protected boolean[] inits;



    protected  MemoryCell(String[] names, boolean[] inits, int [] lengths) {
        this.names = names;
        this.inits = inits;
        fill( lengths);
        deFragmentMemory();
        try {
                 checkUniqueness();
        } catch (Exception ex) {

            ex.printStackTrace();
        }

    }

    public abstract boolean containsName(String src);

    public abstract Object getValueByName(String src);

    public abstract Object getValueByIndex(int index);

    public abstract Object getValueByAdress(String s);

    public abstract Object getValueByAdress(int type, int index);

    protected abstract void fill(int[] lengths);

    protected abstract int[] getBoundOfType(int type);


    protected abstract int indexOf(String name);

    private void checkUniqueness() throws Exception {
        HashSet<String> set = new HashSet<>();
        for (String name : names) {
            if (!set.contains(name)) {
                set.add(name);
            } else {
                throw new Exception(FileLoader.EXEPTION_MESSEGES[6] + name);
            }
        }
    }

    protected abstract void deFragmentMemory();


}
