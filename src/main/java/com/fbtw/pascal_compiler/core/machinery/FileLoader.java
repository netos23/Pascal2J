package com.fbtw.pascal_compiler.core.machinery;

import com.fbtw.pascal_compiler.core.memory_core.VarMemoryCell;
import com.fbtw.pascal_compiler.core.memory_core.arrays.ArrayPrimitiveBuilder;
import com.fbtw.pascal_compiler.core.memory_core.arrays.SimpleArrayPrimitive;

import java.io.File;
import java.util.ArrayList;
import java.util.Scanner;



public class FileLoader {
    public static final String[] KEY_WORDS = {";", ":", "program", "var", "begin", "end", ".", "procedure",
            "function", "(", ")", ",", "shortint", "word", "integer",
            "longinteger", "real", "double", "boolean", "char", "array", "list", "stack", "map", "set", "queue", "deque", "[", "]", "=", "const", "'", "/", "{", "}","of"};
    public static final String[] EXEPTION_MESSEGES = {"in line ", "The program must have one name",
            "The program must have begin and end.", "Expected token: ", " but found: ", "Unexpected token: ", "Name must be uniqueness: ", "Incorrect type: "};
    public static final String[] SPECIAL_SYMBOL = {"-----", "@", "C"};

    private String[] strings;
    private ArrayList<String> varBuffer;
    private ArrayList<String> varBufferValue;
    private ArrayList<String> constBuffer;
    private ArrayList<ArrayList<String>> procBuffer;
    private ArrayList<ArrayList<String>> funcBuffer;
    private ArrayList<String> mainProg;
    private String progName = "";


    public FileLoader(String fileName) throws Exception {
        File input = new File(fileName);
        Scanner in = new Scanner(input);

        varBuffer = new ArrayList<>();
        varBufferValue = new ArrayList<>();
        constBuffer = new ArrayList<>();
        procBuffer = new ArrayList<>();
        funcBuffer = new ArrayList<>();
        mainProg = new ArrayList<>();
        StringBuilder builder = new StringBuilder();

        String temp;
        boolean isCommentary = false;
        while (in.hasNext()) {
            builder.append(" ");
            temp = in.nextLine().toLowerCase();


            // deleting comments
            int index = temp.indexOf(KEY_WORDS[32] + KEY_WORDS[32]);
            int beginIndex = temp.indexOf(KEY_WORDS[33]);
            int endIndex = temp.indexOf(KEY_WORDS[34]);

            if (endIndex < beginIndex && !isCommentary&&  endIndex!=-1) {
                throw new Exception(EXEPTION_MESSEGES[5] + KEY_WORDS[34]);
            } else if (beginIndex >= 0 && endIndex >= 0 && index > beginIndex) {
                temp = temp.substring(0, beginIndex) + temp.substring(endIndex + 1);
            } else if (beginIndex >= 0 && endIndex >= 0
                    || beginIndex >= 0 && beginIndex > index && index != -1
                    || endIndex >= 0 && endIndex > index && index != -1) {

                if(index==-1){
                    temp = temp.substring(0, beginIndex);
                }else{
                    temp = temp.substring(0, index);
                }

            } else if (beginIndex >= 0) {
                temp = temp.substring(0, beginIndex);
                builder.append(temp);
                isCommentary = true;
            } else if (endIndex >= 0) {
                isCommentary = false;
                if (endIndex + 1 < temp.length())
                    temp = temp.substring(endIndex + 1);
                else
                    temp = "";
            } else if (index >= 0) {
                temp = temp.substring(0, index);
            }


            if (!isCommentary)
                builder.append(temp);
        }
        String getMainPart = builder.toString();

        if (!getMainPart.contains(KEY_WORDS[5] + KEY_WORDS[6]))
            throw new Exception(EXEPTION_MESSEGES[2]);

        strings = getMainPart.split(KEY_WORDS[0]);
        loadProgram();

        System.out.println(progName);
        System.out.println("var:::::::::");

        for (ArrayList<String> s : procBuffer) {
            for (String p : s)
                System.out.println(p);
        }
        System.out.println("funct");
        for (ArrayList<String> s : funcBuffer) {
            for (String p : s)
                System.out.println(p);
        }
        for (String s : varBuffer) System.out.println(s);
        for (String s : varBufferValue) System.out.println(s);
        for (String s : constBuffer) System.out.println(s);
        System.out.println("main");
        for (String s : mainProg) System.out.println(s);

        parseMemory();
    }

    public void loadProgram() throws Exception {
        String codeForAnalis;
        boolean varBufferKey = false, constBufferKey = false;
        for (int i = 0; i < strings.length; i++) {
            codeForAnalis = strings[i].trim();
            if ( codeForAnalis.indexOf(KEY_WORDS[4] + " ") == 0) { //main program
                for (; i < strings.length; i++) {
                    mainProg.add(strings[i]);
                }
            } else if (codeForAnalis.indexOf(KEY_WORDS[2] + " ") == 0) { // key word program

                if (progName.equals("")) {
                    progName = codeForAnalis.substring(
                            codeForAnalis.indexOf(" " + KEY_WORDS[2] + " ")
                                    + KEY_WORDS[2].length() + 1).trim();
                    if (progName.contains(" "))
                        throw new Exception(EXEPTION_MESSEGES[3] + KEY_WORDS[0] +
                                EXEPTION_MESSEGES[4] + progName.substring(progName.indexOf(" ")));

                } else {
                    throw new Exception(EXEPTION_MESSEGES[1]);
                }

            } else if (codeForAnalis.indexOf(KEY_WORDS[3] + " ") == 0) {//vars with varKey
                constBufferKey = false;
                varBufferKey = true;
                if (codeForAnalis.contains(KEY_WORDS[1])) {
                    if (!(codeForAnalis.contains(" " + KEY_WORDS[30] + " ") || codeForAnalis.indexOf(KEY_WORDS[30] + " ") == 0)) {
                        if (codeForAnalis.contains(KEY_WORDS[1] + KEY_WORDS[29])) {
                            varBufferValue.add(codeForAnalis.substring(
                                    codeForAnalis.indexOf(" " + KEY_WORDS[3] + " ") +
                                            KEY_WORDS[3].length() + 1).trim());
                        } else {
                            varBuffer.add(codeForAnalis.substring(
                                    codeForAnalis.indexOf(" " + KEY_WORDS[3] + " ") +
                                            KEY_WORDS[3].length() + 1).trim());
                        }
                    } else {
                        throw new Exception(EXEPTION_MESSEGES[5] + KEY_WORDS[30]);
                    }
                } else {
                    throw new Exception(EXEPTION_MESSEGES[3] + KEY_WORDS[1]);
                }

            } else if (codeForAnalis.indexOf(KEY_WORDS[30] + " ") == 0) {//const with constKey
                constBufferKey = true;
                varBufferKey = false;
                if (codeForAnalis.contains(KEY_WORDS[29]) && !codeForAnalis.contains(KEY_WORDS[1] + KEY_WORDS[29])) {

                    constBuffer.add(codeForAnalis.substring(
                            codeForAnalis.indexOf(" " + KEY_WORDS[30] + " ") +
                                    KEY_WORDS[30].length() + 1).trim());

                } else {
                    throw new Exception(EXEPTION_MESSEGES[3] + KEY_WORDS[29]);
                }


            } else if (codeForAnalis.contains(KEY_WORDS[29]) && !varBufferKey) { // const
                if (constBufferKey) {
                    if (!codeForAnalis.contains(KEY_WORDS[1] + KEY_WORDS[29])) {
                        constBuffer.add(codeForAnalis.trim());
                    } else {
                        throw new Exception(EXEPTION_MESSEGES[5] + KEY_WORDS[1]);
                    }

                } else {
                    throw new Exception(EXEPTION_MESSEGES[3] + KEY_WORDS[30]);

                }
            } else if (codeForAnalis.contains(KEY_WORDS[1])) { // vars
                if (varBufferKey) {
                    if (codeForAnalis.contains(KEY_WORDS[1] + KEY_WORDS[29])) {
                        varBufferValue.add(codeForAnalis.trim());
                    } else {
                        varBuffer.add(codeForAnalis.trim());
                    }


                } else {
                    throw new Exception(EXEPTION_MESSEGES[3] + KEY_WORDS[3]);

                }

            } else if (codeForAnalis.indexOf(KEY_WORDS[7] + " ") == 0
                    || codeForAnalis.indexOf(KEY_WORDS[8] + " ") == 0) {// procedures & functions

                boolean isFunction = codeForAnalis.indexOf(KEY_WORDS[8] + " ") == 0;

                varBufferKey = false;
                constBufferKey = false;

                ArrayList<String> procedureInLoad = new ArrayList<>();
                procedureInLoad.add(codeForAnalis.trim());
                procedureInLoad.add(SPECIAL_SYMBOL[0]);
                boolean procVarBufKey = false;
                boolean procConstBufKey = false;
                i++;
                for (; i < strings.length; i++) {
                    codeForAnalis = strings[i].trim();
                    if ( codeForAnalis.indexOf(KEY_WORDS[4] + " ") == 0) {

                        procedureInLoad.add(SPECIAL_SYMBOL[0]);
                        int bracketsCount = 0;
                        if (codeForAnalis.contains(" " + KEY_WORDS[5] + " ")
                                || (codeForAnalis.indexOf(KEY_WORDS[5] + " ") == 0)
                                || (codeForAnalis.indexOf(" " + KEY_WORDS[5]) == codeForAnalis.length() - KEY_WORDS[5].length() - 1)) {
                            if (codeForAnalis.indexOf(KEY_WORDS[5] + " ") == 0) {
                                throw new Exception(EXEPTION_MESSEGES[3] + KEY_WORDS[5]);
                            } else {

                                bracketsCount += calculateBracketsInLine(codeForAnalis);
                                if (bracketsCount == 0) {
                                    procedureInLoad.add(codeForAnalis);
                                    if (isFunction) {
                                        funcBuffer.add(procedureInLoad);
                                    } else {
                                        procBuffer.add(procedureInLoad);
                                    }
                                    procedureInLoad = null;
                                    break;
                                } else if (bracketsCount < 0) {
                                    throw new Exception(EXEPTION_MESSEGES[3] + KEY_WORDS[5]);
                                } else {
                                    procedureInLoad.add(codeForAnalis);
                                    i++;
                                    for (; i < strings.length && bracketsCount != 0; i++) {
                                        codeForAnalis = strings[i];
                                        bracketsCount += calculateBracketsInLine(codeForAnalis);
                                        if (codeForAnalis.contains(" " + KEY_WORDS[5] + KEY_WORDS[6])) {
                                            throw new Exception(EXEPTION_MESSEGES[3] + KEY_WORDS[0]
                                                    + EXEPTION_MESSEGES[4] + KEY_WORDS[6]);
                                        }
                                        procedureInLoad.add(codeForAnalis);
                                    }
                                    if (bracketsCount == 0) {
                                        if (isFunction) {
                                            funcBuffer.add(procedureInLoad);
                                        } else {
                                            procBuffer.add(procedureInLoad);
                                        }

                                        procedureInLoad = null;
                                        break;
                                    }
                                    if (i == strings.length - 1) throw new Exception(EXEPTION_MESSEGES[1]);
                                }
                            }
                        } else {
                            procedureInLoad.add(codeForAnalis);
                            bracketsCount = 1;
                            i++;
                            for (; i < strings.length && bracketsCount != 0; i++) {
                                codeForAnalis = strings[i];
                                bracketsCount += calculateBracketsInLine(codeForAnalis);
                                if (codeForAnalis.contains(" " + KEY_WORDS[5] + KEY_WORDS[6])) {
                                    throw new Exception(EXEPTION_MESSEGES[3] + KEY_WORDS[0]
                                            + EXEPTION_MESSEGES[4] + KEY_WORDS[6]);
                                }
                                procedureInLoad.add(codeForAnalis);
                            }
                            if (bracketsCount == 0) {
                                if (isFunction) {
                                    funcBuffer.add(procedureInLoad);
                                } else {
                                    procBuffer.add(procedureInLoad);
                                }
                                procedureInLoad = null;
                                break;
                            }
                            if (i == strings.length - 1) throw new Exception(EXEPTION_MESSEGES[1]);
                        }
                    } else if (codeForAnalis.indexOf(KEY_WORDS[3] + " ") == 0) { // vars
                        //checkStartOfLine(codeForAnalis, KEY_WORDS[3] + " ");
                        procVarBufKey = true;
                        procConstBufKey = false;
                        if (codeForAnalis.contains(KEY_WORDS[1])) {

                            if (!(codeForAnalis.contains(" " + KEY_WORDS[30] + " ") || codeForAnalis.indexOf(KEY_WORDS[30] + " ") == 0)) {
                                if (codeForAnalis.contains(KEY_WORDS[1] + KEY_WORDS[29])) {
                                    procedureInLoad.add(SPECIAL_SYMBOL[1] + codeForAnalis.substring(
                                            codeForAnalis.indexOf(" " + KEY_WORDS[3] + " ") +
                                                    KEY_WORDS[3].length() + 1).trim());
                                } else {
                                    procedureInLoad.add(codeForAnalis.substring(
                                            codeForAnalis.indexOf(" " + KEY_WORDS[3] + " ") +
                                                    KEY_WORDS[3].length() + 1).trim());
                                }
                            } else {
                                throw new Exception(EXEPTION_MESSEGES[5] + KEY_WORDS[30]);
                            }

                        } else {
                            throw new Exception(EXEPTION_MESSEGES[3] + KEY_WORDS[1]);
                        }
                    } else if (codeForAnalis.indexOf(KEY_WORDS[30] + " ") == 0) {//const with constKey
                        //checkStartOfLine(codeForAnalis, KEY_WORDS[30] + " ");
                        procConstBufKey = true;
                        procVarBufKey = false;
                        if (codeForAnalis.contains(KEY_WORDS[29]) && !codeForAnalis.contains(KEY_WORDS[1] + KEY_WORDS[29])) {

                            procedureInLoad.add(SPECIAL_SYMBOL[2] + SPECIAL_SYMBOL[1] + codeForAnalis.substring(
                                    codeForAnalis.indexOf(" " + KEY_WORDS[30] + " ") +
                                            KEY_WORDS[30].length() + 1).trim());

                        } else {
                            throw new Exception(EXEPTION_MESSEGES[3] + KEY_WORDS[29]);
                        }


                    } else if (codeForAnalis.contains(KEY_WORDS[29]) && !procVarBufKey) { // const
                        if (procConstBufKey) {
                            if (!codeForAnalis.contains(KEY_WORDS[1] + KEY_WORDS[29])) {
                                procedureInLoad.add(SPECIAL_SYMBOL[2] + SPECIAL_SYMBOL[1] + codeForAnalis.trim());
                            } else {
                                throw new Exception(EXEPTION_MESSEGES[5] + KEY_WORDS[1]);
                            }

                        } else {
                            throw new Exception(EXEPTION_MESSEGES[3] + KEY_WORDS[30]);

                        }
                    } else if (codeForAnalis.contains(KEY_WORDS[1])) { // vars
                        if (procVarBufKey) {


                            if (codeForAnalis.contains(KEY_WORDS[1] + KEY_WORDS[29])) {
                                procedureInLoad.add(SPECIAL_SYMBOL[1] + codeForAnalis.trim());
                            } else {
                                procedureInLoad.add(codeForAnalis.trim());
                            }


                        } else {
                            throw new Exception(EXEPTION_MESSEGES[3] + KEY_WORDS[3]);

                        }
                    } else {
                        throw new Exception(EXEPTION_MESSEGES[5] + codeForAnalis);
                    }
                }


            } else {
                throw new Exception(EXEPTION_MESSEGES[5] + codeForAnalis);
            }

        }

    }

    private int calculateBracketsInLine(String src) {
        int i = 0;
        String srcCopy = src;
        while (src.contains(" " + KEY_WORDS[4] + " ")
                || (src.contains(KEY_WORDS[4] + " ") && src.indexOf(KEY_WORDS[4] + " ") == 0)) {
            if (src.indexOf(KEY_WORDS[4] + " ") == 0)
                src = src.substring(src.indexOf(KEY_WORDS[4] + " ") + KEY_WORDS[4].length());
            else
                src = src.substring(src.indexOf(" " + KEY_WORDS[4] + " ") + KEY_WORDS[4].length() + 1);
            i++;
        }
        if (srcCopy.trim().equals(KEY_WORDS[5] + KEY_WORDS[6]) || srcCopy.trim().equals(KEY_WORDS[5])) {
            i--;
        } else {
            while (srcCopy.contains(" " + KEY_WORDS[5] + " ")
                    || (srcCopy.contains(KEY_WORDS[5] + " ") && srcCopy.indexOf(KEY_WORDS[5] + " ") == 0)
                    || (srcCopy.contains(" " + KEY_WORDS[5]) && srcCopy.indexOf(" " + KEY_WORDS[5]) == srcCopy.length() - KEY_WORDS[5].length() - 1)) {
                if (srcCopy.indexOf(KEY_WORDS[5] + " ") == 0) {
                    srcCopy = srcCopy.substring(srcCopy.indexOf(KEY_WORDS[5] + " ") + KEY_WORDS[5].length());
                } else if (srcCopy.indexOf(" " + KEY_WORDS[5]) == srcCopy.length() - KEY_WORDS[5].length() - 1) {
                    i--;
                    break;
                } else
                    srcCopy = srcCopy.substring(srcCopy.indexOf(" " + KEY_WORDS[5] + " ") + KEY_WORDS[5].length() + 1);
                i--;
            }
        }


        return i;
    }

    /*private void checkStartOfLine(String someCode, String v) throws Exception {
        int index = -1;

        index = someCode.indexOf(v);

        if (index > 0) {
            if (!someCode.substring(0, index).trim().equals(""))
                throw new Exception(EXEPTION_MESSEGES[5] + someCode.substring(0, index).trim());
        }
    }*/


    private void parseMemory() {
        VarMemoryCell.VarMemoryCellBuilder builder =
                new VarMemoryCell.VarMemoryCellBuilder();

        SimpleArrayPrimitive.SimpleArrayPrimitiveBuilder arrBuilder =
                new SimpleArrayPrimitive.SimpleArrayPrimitiveBuilder(builder);



        for (String s : varBuffer) {
            if(s.contains(KEY_WORDS[20])){
                try {
                    arrBuilder.parseArray(parseArrayToBuilder(s,1));
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }else {
                builder.parseVars(s.substring(0, s.indexOf(KEY_WORDS[1])).trim(), s.substring(s.indexOf(KEY_WORDS[1]) + 1).trim());
            }
        }
        for (String s : varBufferValue) {
            builder.parsVarsWithValues(s);
        }
        for (String s: constBuffer){
            builder.parseConst(s);
        }
        try {
            VarMemoryCell varMemoryCell = (VarMemoryCell) builder.build();
            arrBuilder.setStorge(varMemoryCell);

            SimpleArrayPrimitive primitive = (SimpleArrayPrimitive) arrBuilder.build();
            primitive.getAbsoluteAdress(new Integer[]{3,4,5});
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void splitVars(){

    }


    private String[] parseArrayToBuilder(String s, int readonly) throws Exception {
        String [] splitedHead = s.split(KEY_WORDS[35]);
        for(int i=0;i<splitedHead.length-1;i++){
            int beginIndex = splitedHead[i].indexOf(KEY_WORDS[27]);
            int endIndex = splitedHead[i].indexOf(KEY_WORDS[28]);

            if(endIndex*beginIndex>=0&&endIndex>beginIndex){
                splitedHead[i] = splitedHead[i].substring(beginIndex+1,endIndex);
            }else {
                throw new Exception("Incorrect array declaration");
            }
        }

        return splitedHead;
    }
}










