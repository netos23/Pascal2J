package com.fbtw.pascal_compiler.core.memory_core.arrays;

import com.fbtw.pascal_compiler.core.memory_core.VarMemoryCell;

public abstract class ArrayPrimitive {
     int memoryIndex;
     int memoryLenth;

     int [] beginIndexes;
     int type;
     VarMemoryCell storge;



    boolean readonly = false;
     private ArrayPrimitive(){}

    ArrayPrimitive(int memoryIndex, int[] beginIndexes, int type, VarMemoryCell storge) {
        this.memoryIndex = memoryIndex;
        this.beginIndexes = beginIndexes;
        this.type = type;
        this.storge = storge;
    }

    public boolean isReadonly() {
        return readonly;
    }

    public void setReadonly(boolean readonly) {
        this.readonly = readonly;
    }

    public abstract Object getElement(Integer [] localAdress) throws  Exception;

    public abstract Object getElement(int memoryAdress) throws Exception;

    public abstract void setElement(Object element, Integer [] localAdress);

    public abstract void setElement(Object element, int memoryAdress);

    public abstract Integer[] getAbsoluteAdress(Integer[] localAdress);

    public abstract ArrayPrimitive getSubArray(int [] Indexes);

    protected abstract boolean validateIndexes(Integer [] localAdress);

    protected abstract int elementIndexToAddress(Integer [] localAdress);





}
