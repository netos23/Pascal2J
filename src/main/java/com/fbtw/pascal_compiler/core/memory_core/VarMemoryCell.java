package com.fbtw.pascal_compiler.core.memory_core;

import com.fbtw.pascal_compiler.core.machinery.FileLoader;
import com.fbtw.pascal_compiler.utils.DataPair;
import com.fbtw.pascal_compiler.utils.SymbolChecker;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.UUID;

public class VarMemoryCell extends MemoryCell {

    /**
     * Адресация формата Integer[>=3] {type,localIndex,readonly,....other}
     */

    private static Object[] DEFOULT_VALUES = {0, 0, 0, 0, 0, 0, 0, '0'};
    private static Class[] TYPE_CLASSES = {Byte.class, Short.class, Integer.class, Long.class,
            Float.class, Double.class, Boolean.class, Character.class};

    private Byte[] shortIntVars; //0
    private Short[] wordVars; //1
    private Integer[] integerVars; //2
    private Long[] longIntVars; //3
    private Float[] realVars; //4
    private Double[] doubleVars; //5
    private Boolean[] booleanVars; //6
    private Character[] chars; //7


    protected VarMemoryCell(ArrayList<DataPair<Integer[]>> names, ArrayList<Integer[]> lengths) {
        super(names, lengths);

    }

    @Override
    public Object getValue(Integer[] id) throws Exception {
        if (id != null) {
            switch (id[0]) {
                case 0:
                    return shortIntVars[id[1]];
                case 1:
                    return wordVars[id[1]];

                case 2:
                    return integerVars[id[1]];

                case 3:
                    return longIntVars[id[1]];

                case 4:
                    return realVars[id[1]];

                case 5:
                    return doubleVars[id[1]];

                case 6:
                    return booleanVars[id[1]];

                case 7:
                    return chars[id[1]];

                default:
                    throw new Exception("Incorrect index");


            }
        } else {

            throw new Exception("Incorrect index");
        }

    }

    public void setValue(Integer[] id, String value) {
        switch (id[0]) {
            case 0:
                setValue(id, Byte.parseByte(value));
                break;
            case 1:
                setValue(id, Short.parseShort(value));
                break;
            case 2:
                setValue(id, Integer.parseInt(value));
                break;
            case 3:
                setValue(id, Long.parseLong(value));
                break;
            case 4:
                setValue(id, Float.parseFloat(value));
                break;
            case 5:
                setValue(id, Double.parseDouble(value));
                break;
            case 6:
                setValue(id, Boolean.parseBoolean(value.toLowerCase()));
                break;
            case 7:
                setValue(id, value.charAt(0));
                break;
        }
    }



    public void setValue(Integer[] id, Integer value) {
        integerVars[id[1]] = value;
    }

    public void setValue(Integer[] id, Byte value) {
        shortIntVars[id[1]] = value;
    }

    public void setValue(Integer[] id, Long value) {
        longIntVars[id[1]] = value;
    }

    public void setValue(Integer[] id, Short value) {
        wordVars[id[1]] = value;
    }

    public void setValue(Integer[] id, Float value) {
        realVars[id[1]] = value;
    }

    public void setValue(Integer[] id, Double value) {
        doubleVars[id[1]] = value;
    }

    public void setValue(Integer[] id, Boolean value) {
        booleanVars[id[1]] = value;
    }

    public void setValue(Integer[] id, Character value) {
        chars[id[1]] = value;
    }


    @Override
    public Integer[] getAdress(String name) {  // todo: проверить адресацию и доделать.
        searchDataPairItem.updateName(name);
        int index = Collections.binarySearch(names, searchDataPairItem);
        if (index >= 0) {
            return names.get(index).getValue();
        } else {
            return null;
        }
    }

    @Override
    void fill(ArrayList<Integer[]> lengths) {
        if (lengths.get(0)[0] > 0) {
            shortIntVars = new Byte[lengths.get(0)[0]];
            Arrays.fill(shortIntVars, DEFOULT_VALUES[0]);
        }
        if (lengths.get(0)[1] > 0) {
            wordVars = new Short[lengths.get(0)[1]];
            Arrays.fill(wordVars, DEFOULT_VALUES[1]);
        }
        if (lengths.get(0)[2] > 0) {
            integerVars = new Integer[lengths.get(0)[2]];
            Arrays.fill(integerVars, DEFOULT_VALUES[2]);
        }
        if (lengths.get(0)[3] > 0) {
            longIntVars = new Long[lengths.get(0)[3]];
            Arrays.fill(longIntVars, DEFOULT_VALUES[3]);
        }
        if (lengths.get(0)[4] > 0) {
            realVars = new Float[lengths.get(0)[4]];
            Arrays.fill(realVars, DEFOULT_VALUES[4]);
        }
        if (lengths.get(0)[5] > 0) {
            doubleVars = new Double[lengths.get(0)[5]];
            Arrays.fill(doubleVars, DEFOULT_VALUES[5]);
        }
        if (lengths.get(0)[6] > 0) {
            booleanVars = new Boolean[lengths.get(0)[6]];
            Arrays.fill(booleanVars, (DEFOULT_VALUES[6].equals(0)) ? Boolean.FALSE : Boolean.TRUE);
        }
        if (lengths.get(0)[7] > 0) {
            chars = new Character[lengths.get(0)[7]];
            Arrays.fill(chars, DEFOULT_VALUES[7]);
        }

    }

    public static class VarMemoryCellBuilder extends CellBuilder {

        public VarMemoryCellBuilder() {
            super();
            countValues = new int[8];
            Arrays.fill(countValues, 0);

        }

        @Override
        public VarMemoryCellBuilder parseVars(String vars, String type) {
            parseVars(vars, getType(type));
            return this;
        }

        public VarMemoryCellBuilder parseVars(String vars, int type, int readOnly) {

            String[] splitedVars = vars.split(FileLoader.KEY_WORDS[11]);
            lengths[type] += splitedVars.length;
            for (int i = 0; i < splitedVars.length; i++) {
                names.add(new DataPair<>(splitedVars[i], new Integer[]{type, countValues[type], readOnly}));
                countValues[type]++;
            }

            return this;
        }
        public VarMemoryCellBuilder parseVars(String vars, int type) {
            parseVars(vars,type,1);
            return this;
        }



        public boolean parseConst(String constants) {

            try {
                int type = getConstType(constants);
                if(type>-1){
                    int beginIndex = constants.indexOf(FileLoader.KEY_WORDS[1]);
                    String name;
                    int endIndex = constants.indexOf(FileLoader.KEY_WORDS[29]);
                    if(beginIndex>0){
                        name = constants.substring(0,beginIndex);
                    }else {
                        name = constants.substring(0,endIndex);
                    }
                    parseVars(name,type,0);
                    if(type!=7){
                        valuesForInit.add(new DataPair<>(name,constants.substring(endIndex+1)));
                    }else{
                        valuesForInit.add(new DataPair<>(name,""+constants.charAt(
                                constants.indexOf(FileLoader.KEY_WORDS[31])+1)));
                    }
                }else{
                    return false;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            return true;
        }

        public VarMemoryCellBuilder arrayContract(int count,int type, int readOnly){

            for(int i=0;i<count;i++){
                String name = FileLoader.SPECIAL_SYMBOL[1]+System.currentTimeMillis()/100;
                parseVars(name,type,readOnly);
            }
            return this;
        }

        public VarMemoryCellBuilder arrayContractWithValue(Object [] values, int type,int readOnly){

            for (Object value : values) {
                String name = FileLoader.SPECIAL_SYMBOL[1] + System.currentTimeMillis() / 100;
                parseVars(name, type, readOnly);
                valuesForInit.add(new DataPair<String>(name, value + ""));
            }
            return this;
        }

        public boolean parsVarsWithValues(String strWithValue) {
            try {
                int type = getValueType(strWithValue);
                if (type > -1) {
                    String name = strWithValue.substring(0, strWithValue.indexOf(FileLoader.KEY_WORDS[1]));
                    parseVars(name, type);
                    if (type != 7) {
                        valuesForInit.add(new DataPair<String>(name,
                                strWithValue.substring(strWithValue.indexOf(FileLoader.KEY_WORDS[29]) + 1)));
                    } else {
                        valuesForInit.add(new DataPair<String>(name,
                                "" + strWithValue.charAt(strWithValue.indexOf(FileLoader.KEY_WORDS[31]) + 1)));
                    }

                } else {
                    return false;
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
            return true;
        }


        @Override
        public MemoryCell build() throws Exception {
            ArrayList<Integer[]> list = new ArrayList<>();
            list.add(lengths);
            VarMemoryCell res = new VarMemoryCell(names, list);
            for (DataPair<String> dp : valuesForInit) {
                res.setValue(res.getAdress(dp.getName()), dp.getValue());
            }
            return res;
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
        public int getValueType(String strWithValue) throws Exception {
            String type;
            if (strWithValue.indexOf(FileLoader.KEY_WORDS[1]) == strWithValue.lastIndexOf(FileLoader.KEY_WORDS[1])) {
                type = "";
            } else {
                type = strWithValue.substring(strWithValue.indexOf(FileLoader.KEY_WORDS[1]) + 1,
                        strWithValue.indexOf(FileLoader.KEY_WORDS[1] + FileLoader.KEY_WORDS[29])).trim();
            }


            if (type.equals("")) {
                type = strWithValue.substring(strWithValue.indexOf(FileLoader.KEY_WORDS[1] + FileLoader.KEY_WORDS[29]) + 2);
                int beginIndex = type.indexOf(FileLoader.KEY_WORDS[31]);
                int endInedx = type.lastIndexOf(FileLoader.KEY_WORDS[31]);
                if (beginIndex > -1) {
                    if (beginIndex < endInedx) {
                        if (endInedx-beginIndex==2) {
                            return 7;
                        } else {
                            return -1;
                        }
                    } else {
                        throw new Exception(FileLoader.EXEPTION_MESSEGES[5] + FileLoader.KEY_WORDS[32]);
                    }
                } else {
                    if (SymbolChecker.isNumber(type)) {
                        return 2;
                    } else {
                        return -1;
                    }
                }

            } else return getType(type);


        }

        @Override
        public int getConstType(String strWithValue) throws Exception {
            int index = strWithValue.indexOf(FileLoader.KEY_WORDS[1]);
            if (index > 0) {
                return getType(strWithValue.substring(index + 1, strWithValue.indexOf(FileLoader.KEY_WORDS[29])));
            } else {
                index = strWithValue.indexOf(FileLoader.KEY_WORDS[31]);
                if (index >= 0) {
                    int endIndex = strWithValue.lastIndexOf(FileLoader.KEY_WORDS[31]);
                    if(index!=endIndex){
                        if(endIndex-index==2){
                            return 7;
                        }else {
                            return  -1;
                        }
                    }else {
                        throw new Exception(FileLoader.EXEPTION_MESSEGES[3]+FileLoader.KEY_WORDS[31]);
                    }
                } else {
                    if (SymbolChecker.isNumber(strWithValue.substring(strWithValue.indexOf(FileLoader.KEY_WORDS[29])+1))) {
                        return 2;
                    } else {
                        return -1;
                    }
                }
            }
        }

        @Override
        public int getArrayFirstIndex(int type) {
            return countValues[type];
        }


    }


}

