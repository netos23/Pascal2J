package com.fbtw.pascal_compiler;


import com.fbtw.pascal_compiler.core.machinery.FileLoader;

public class PascalCompilerApplication  {


	public static void main(String [] args) {
		/*String str  = "begin end else begin end end";

        ArrayList<DataPair<Integer>> pairs = new ArrayList<>();
        pairs.add(new DataPair<>("n",9));




        System.out.println(Byte.class.toString());*/


		try {System.out.println(FileLoader.KEY_WORDS.length);
			FileLoader loader = new FileLoader("test.pas");

			//VarMemoryCell.VarMemoryCellBuilder r = new VarMemoryCell.VarMemoryCellBuilder();

		}catch (Exception ex){
			ex.printStackTrace();
		}



	}



}
