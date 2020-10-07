package com.fbtw.pascal_compiler.core.memory_core.arrays;

import com.fbtw.pascal_compiler.core.machinery.FileLoader;
import com.fbtw.pascal_compiler.core.memory_core.VarMemoryCell;
import org.springframework.expression.ExpressionParser;

public class SimpleArrayPrimitive  extends ArrayPrimitive {


    private int [] dimensions;


     SimpleArrayPrimitive(int memoryIndex, int[] dimensions, int[] beginIndexes, int type, VarMemoryCell storge) {
        super(memoryIndex,beginIndexes,type,storge);
        this.dimensions = dimensions;

        memoryLenth=1;
        for(int dim : dimensions){
            memoryLenth*=dim;
        }

    }


    private Integer [] normolaizeIndexes(Integer [] indexes){
        for(int i=0;i<indexes.length;i++){
            indexes[i]-=beginIndexes[i];
        }
        return indexes;
    }

    @Override
    protected int elementIndexToAddress(Integer [] localAdress){
        int index = 0,tmp=1;
        for (int i = 0; i < localAdress.length; i++) {
            tmp*=localAdress[i];
            for (int j = i + 1; j < localAdress.length-1; j++) {
                tmp*=dimensions[j];
            }

            index+=tmp;
            tmp=1;
        }
        index--;

        return memoryIndex+index;

    }

    @Override
    public Object getElement(Integer [] localAdress) throws Exception {
        int index = elementIndexToAddress(localAdress);
        return getElement(index);
    }

    @Override
    public Object getElement(int memoryAdress) throws Exception {
        return  storge.getValue(new Integer[]{type,memoryAdress});
    }

    @Override
    public Integer[] getAbsoluteAdress(Integer [] localAdress) {
        int memoryIndex = elementIndexToAddress(localAdress);
        return new Integer[]{type,memoryIndex};
    }

    @Override
    public ArrayPrimitive getSubArray(int[] Indexes) {
        return null;
    }

    @Override
    protected boolean validateIndexes(Integer[] localAdress) {

        return false;
    }


    @Override
    public void setElement(Object element, int memoryAdress){
        Integer [] adress = new Integer[]{type,memoryAdress};
        storge.setValue(adress,element.toString());
    }


    @Override
    public void setElement(Object element, Integer [] localAdress){
        int index = elementIndexToAddress(localAdress);
        setElement(element,index);
    }



    
    //todo : поменять модификатор доступа
    public static class SimpleArrayPrimitiveBuilder extends ArrayPrimitiveBuilder {

         int[] dimensions;

        public SimpleArrayPrimitiveBuilder(VarMemoryCell.VarMemoryCellBuilder storgeBuilder) {
            super(storgeBuilder);
        }

        @Override
        public ArrayPrimitive build() throws Exception {
            SimpleArrayPrimitive array;
            if(storge!=null){
               array = new SimpleArrayPrimitive(memoryIndex,dimensions,beginIndexes,type,(VarMemoryCell) storge);
            }else{
                throw new Exception("Storge is null");
            }

            memoryIndex=-1;
            dimensions=null;
            beginIndexes=null;
            type=-1;

            return array;

        }

        @Override
        public ArrayPrimitiveBuilder parseArray(String[] splitedHead) throws Exception {
            String typeString = splitedHead[splitedHead.length-1].trim();
            type = storgeBuilder.getType(typeString);
            if(type>-1) {
                memoryIndex = storgeBuilder.getArrayFirstIndex(type);


                int dimensionsCount = splitedHead.length - 1;
                beginIndexes = new int[dimensionsCount];
                dimensions = new int[dimensionsCount];

                for (int i=0;i<splitedHead.length-1;i++){
                    String temp = splitedHead[i].trim();


                    int median = temp.indexOf(FileLoader.KEY_WORDS[6]+FileLoader.KEY_WORDS[6]);
                    if(median>0){
                        beginIndexes[i] = Integer.parseInt(temp.substring(0,median));

                        dimensions[i] = Integer.parseInt(temp.substring(median+2))-beginIndexes[i]+1;
                    }else{
                        throw new Exception("Incorrect array declaration ");
                    }

                }
            }else {
                throw new Exception(FileLoader.EXEPTION_MESSEGES[5]+" "+typeString);
            }
            return this;
        }

        @Override
        public ArrayPrimitiveBuilder parseArrayWithValues(String[] splitedHead, String values) {
            return this;
        }

        @Override
        public ArrayPrimitiveBuilder parseConstArray(String[] splitedHead, String values) {
            parseArrayWithValues(splitedHead,values);
            return this;
        }


    }


}
