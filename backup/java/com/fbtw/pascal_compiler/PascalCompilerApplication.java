package com.fbtw.pascal_compiler;


import com.fbtw.pascal_compiler.core.data_types.memory_core.VarMemoryCell;
import com.fbtw.pascal_compiler.core.machinery.FileLoader;

public class PascalCompilerApplication  {


	public static void main(String [] args) {
		String str  = "begin end else begin end end";
		try {
			FileLoader loader = new FileLoader("test.pas");
			VarMemoryCell.VarMemoryCellBuilder r = new VarMemoryCell.VarMemoryCellBuilder();

		}catch (Exception ex){
			ex.printStackTrace();
		}





	}



}
