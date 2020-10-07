package com.fbtw.pascal_compiler.core.memory_core.arrays;

import com.fbtw.pascal_compiler.core.memory_core.CellBuilder;
import com.fbtw.pascal_compiler.core.memory_core.MemoryCell;


public abstract class ArrayPrimitiveBuilder {

    int type;
    int memoryIndex;
    MemoryCell storge;

    int [] beginIndexes;

    CellBuilder storgeBuilder;

    public ArrayPrimitiveBuilder(CellBuilder storgeBuilder) {
        this.storgeBuilder = storgeBuilder;
        storge = null;
    }

    public abstract ArrayPrimitive build() throws Exception;

    public abstract ArrayPrimitiveBuilder parseArray(String[] splitedHead) throws Exception;

    public abstract ArrayPrimitiveBuilder parseArrayWithValues(String[] splitedHead, String values);


    public void setStorge(MemoryCell storge) {
        this.storge = storge;
    }

    public abstract ArrayPrimitiveBuilder parseConstArray(String[] splitedHead, String values);
}
