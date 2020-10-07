package com.fbtw.pascal_compiler.core.data_types.memory_core;

import com.fbtw.pascal_compiler.core.machinery.FileLoader;
import com.fbtw.pascal_compiler.utils.SymbolChecker;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Arrays;

public class VarMemoryCell extends MemoryCell {

    private static Object[] DEFOULT_VALUES = {0, 0, 0, 0, 0, 0, 0, 0};
    private static Class[] TYPE_CLASSES ={ Byte.class, Short.class,Integer.class,Long.class,Float.class,Double.class,Boolean.class,Character.class};

    private Byte[] shortIntVars; //0
    private Short[] wordVars; //1
    private Integer[] integerVars; //2
    private Long[] longIntVars; //3
    private Float[] realVars; //4
    private Double[] doubleVars; //5
    private Boolean[] booleanVars; //6
    private Character[] chars; //7

    public VarMemoryCell(String[] names, boolean[] inits, int[] lengths) {
        super(names, inits, lengths);
    }

    @Override
    protected void fill(int[] lengths) {
        if (inits[0]) {
            shortIntVars = new Byte[lengths[0]];
            Arrays.fill(shortIntVars, DEFOULT_VALUES[0]);
        }
        if (inits[1]) {
            wordVars = new Short[lengths[1]];
            Arrays.fill(wordVars, DEFOULT_VALUES[1]);
        }
        if (inits[2]) {
            integerVars = new Integer[lengths[2]];
            Arrays.fill(integerVars, DEFOULT_VALUES[2]);
        }
        if (inits[3]) {
            longIntVars = new Long[lengths[3]];
            Arrays.fill(longIntVars, DEFOULT_VALUES[3]);
        }
        if (inits[4]) {
            realVars = new Float[lengths[4]];
            Arrays.fill(realVars, DEFOULT_VALUES[4]);
        }
        if (inits[5]) {
            doubleVars = new Double[lengths[5]];
            Arrays.fill(doubleVars, DEFOULT_VALUES[5]);
        }
        if (inits[6]) {
            booleanVars = new Boolean[lengths[6]];
            Arrays.fill(booleanVars, (DEFOULT_VALUES[6].equals(0)) ? Boolean.FALSE : Boolean.TRUE);
        }
        if (inits[7]) {
            chars = new Character[lengths[7]];
            Arrays.fill(chars, DEFOULT_VALUES[7]);
        }


    }

    @Override
    public boolean containsName(String src) {
        return indexOf(src) >= 0;
    }

    @Override
    public Object getValueByIndex(int index) {
        if (index < 0 || index > names.length)
            throw new ArrayIndexOutOfBoundsException(index);
        int counter = 0;
        int[] cortege = new int[0];
        for (int i = 0; i < inits.length; i++) {
            cortege = getBoundOfType(i);
            if (cortege[0] > index) {
                cortege = getBoundOfType(i - 1);
                counter = i - 1;
                break;
            }

        }
        return getValueByAdress(counter, index - cortege[0]);
    }

    @Override
    public Object getValueByAdress(String s) {
        int i = Integer.parseInt(s.substring(0, s.indexOf(FileLoader.SPECIAL_SYMBOL[1])));
        int j = Integer.parseInt(s.substring(s.indexOf(FileLoader.SPECIAL_SYMBOL[1]) + 1));
        return getValueByAdress(i, j);
    }

    @Override
    public Object getValueByAdress(int type, int index) {

        switch (type) {
            case 0:
                return shortIntVars[index];
            case 1:
                return wordVars[index];
            case 2:
                return integerVars[index];
            case 3:
                return longIntVars[index];
            case 4:
                return realVars[index];
            case 5:
                return doubleVars[index];
            case 6:
                return booleanVars[index];
            case 7:
                return chars[index];


        }
        return null;
    }

    @Override
    public Object getValueByName(String src) {
        return getValueByIndex(indexOf(src));
    }

    public void setValueByName(String src, Object value) {
        setValueByIndex(indexOf(src), value);
    }

    public void setValueByIndex(int index, Object value) {
        if (index < 0 || index > names.length)
            throw new ArrayIndexOutOfBoundsException(index);
        int counter = 0;
        int[] cortege = new int[0];
        for (int i = 0; i < inits.length; i++) {
            cortege = getBoundOfType(i);
            if (cortege[0] > index) {
                cortege = getBoundOfType(i - 1);
                counter = i - 1;
                break;
            }

        }
        setValueByAdress(counter, index - cortege[0], value);
    }

    public void setValueByAdress(String src, Object value) {
        int i = Integer.parseInt(src.substring(0, src.indexOf(FileLoader.SPECIAL_SYMBOL[1])));
        int j = Integer.parseInt(src.substring(src.indexOf(FileLoader.SPECIAL_SYMBOL[1]) + 1));
        setValueByAdress(i, j, value);
    }

    public void setValueByAdress(int type, int index, Object value) {
        switch (type) {
            case 0:
                shortIntVars[index] = (byte) value;
                break;
            case 1:
                wordVars[index] = (short) value;
                break;
            case 2:
                integerVars[index] = (int) value;
                break;
            case 3:
                longIntVars[index] = (long) value;
                break;
            case 4:
                realVars[index] = (float) value;
                break;
            case 5:
                doubleVars[index] = (double) value;
                break;
            case 6:
                booleanVars[index] = (boolean) value;
            case 7:
                chars[index] = (char) value;


        }
    }


    @Override
    protected int[] getBoundOfType(int type) {
        int i = 0;
        int j = 0;
        switch (type) {
            case 0:
                if (inits[0]) {
                    i += shortIntVars.length;
                    j = i - shortIntVars.length;
                }
            case 1:
                if (inits[1]) {
                    i += wordVars.length;
                    j = i - wordVars.length;
                }
            case 2:
                if (inits[2]) {
                    i += integerVars.length;
                    j = i - integerVars.length;
                }
            case 3:
                if (inits[3]) {
                    i += longIntVars.length;
                    j = i - longIntVars.length;
                }
            case 4:
                if (inits[4]) {
                    i += realVars.length;
                    j = i - realVars.length;
                }
            case 5:
                if (inits[5]) {
                    i += doubleVars.length;
                    j = i - doubleVars.length;
                }
            case 6:
                if (inits[6]) {
                    i += booleanVars.length;
                    j = i - booleanVars.length;
                }
            case 7:
                if (inits[7]) {
                    i += chars.length;
                    j = i - chars.length;
                }
        }
        int[] r = {j, i};
        return new int[2]{1,0};
    }

    @Override
    protected int indexOf(String name) {
        int[] cortege;
        int index = -1;
        for (int i = 0; i < inits.length; i++) {
            cortege = getBoundOfType(i);
            index = Arrays.binarySearch(names, cortege[0], cortege[1], name);
        }
        return index;
    }

    @Override
    protected void deFragmentMemory() {
        int[] cortege;
        for (int i = 0; i < inits.length; i++) {
            cortege = getBoundOfType(i);
            Arrays.sort(names, cortege[0], cortege[1]);
        }

    }

    public static class VarMemoryCellBuilder extends CellBuilder {

        public VarMemoryCellBuilder parseVars(String vars, String type) {

            return parseVars(vars,getType(type));
        }

        public VarMemoryCellBuilder parseVars(String vars, int type) {
                if (!inits[type]) {
                    inits[type] = true;
                    names[type].append(vars);
                } else {
                    names[type].append(FileLoader.KEY_WORDS[11]);
                    names[type].append(vars);
                }

            return this;
        }

        public VarMemoryCellBuilder parsVarsWithValues(String strWithValue){
            try {
                int type = getValueType(strWithValue);
                if(type>-1){
                    String name = strWithValue.substring(0,strWithValue.indexOf(FileLoader.KEY_WORDS[1]));

                }
            }catch (Exception ex){
                ex.printStackTrace();
            }
            return this;
        }


        @Override
        public MemoryCell build() throws Exception {
            ArrayList<String> strings = new ArrayList<>();
            String[] tempStrings;
            for (int i = 0; i < inits.length; i++) {
                if (inits[i]) {
                    tempStrings = names[i].toString().split(FileLoader.KEY_WORDS[11]);
                    lengths[i] = tempStrings.length;
                    for (int j = 0; j < tempStrings.length; j++) {
                        tempStrings[j] = tempStrings[j].trim();
                        if (tempStrings[j].contains(" ")) {
                            throw new Exception(FileLoader.EXEPTION_MESSEGES[3] + FileLoader.KEY_WORDS[11]
                                    + FileLoader.EXEPTION_MESSEGES[4]
                                    + tempStrings[j].substring(tempStrings[j].indexOf(" ")));
                        } else {
                            strings.add(tempStrings[j]);
                        }
                    }

                }
            }
            tempStrings = new String[strings.size()];
            return new VarMemoryCell(strings.toArray(tempStrings), inits, lengths);
        }

        @Override
        public int getType(String type) /*throws Exception*/ {
            if (type.equals(FileLoader.KEY_WORDS[12])) {
                return 0;
            } else if (type.equals(FileLoader.KEY_WORDS[13])) {
                return 1;
            } else if (type.equals(FileLoader.KEY_WORDS[14])) {
                return 2;
            } else if (type.equals(FileLoader.KEY_WORDS[15])) {
                return 3;
            } else if (type.equals(FileLoader.KEY_WORDS[16])) {
                return 4;
            } else if (type.equals(FileLoader.KEY_WORDS[17])) {
                return 5;
            } else if (type.equals(FileLoader.KEY_WORDS[18])) {
                return 6;
            } else if (type.equals(FileLoader.KEY_WORDS[19])) {
                return 7;
            } else {
                return -1;
                /*throw new Exception(FileLoader.EXEPTION_MESSEGES[7] + type);*/
            }


        }


        @Override
        public int getValueType(String strWithValue) throws Exception{
           String type = strWithValue.substring(strWithValue.indexOf(FileLoader.KEY_WORDS[1]),
                   strWithValue.indexOf(FileLoader.KEY_WORDS[1]+FileLoader.KEY_WORDS[29]));

           if(type.equals("")){
               type = strWithValue.substring(strWithValue.indexOf(FileLoader.KEY_WORDS[1]+FileLoader.KEY_WORDS[29]));
               int beginIndex = type.indexOf(FileLoader.KEY_WORDS[32]);
               int endInedx = type.lastIndexOf(FileLoader.KEY_WORDS[32]);
               if(beginIndex>-1){
                   if(beginIndex<endInedx){
                       if(type.substring(beginIndex,endInedx).length()==1){
                           return 7;
                       }else{
                           return -1;
                       }
                   }else{
                       throw new Exception(FileLoader.EXEPTION_MESSEGES[5]+FileLoader.KEY_WORDS[32]);
                   }
               }else{
                    if(SymbolChecker.isNumber(type)){
                        return 2;
                    }else{
                        return -1;
                    }
               }




           }else return getType(type);


        }

       /* @Override
        protected <E> E toValue(String val, Class<E> type) {


        }*/
    }


}
