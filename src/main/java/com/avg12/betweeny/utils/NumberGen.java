package com.avg12.betweeny.utils;

import java.util.Random;

public class NumberGen {

	
	/**
	 * 
	 * @param len authCode length
	 * @return authCode(length : len)
	 */
	public static String getNum(int len) {
		
		Random rand  = new Random();
        String numStr = "";
        for(int i=0; i<len; i++) {
            String ran = Integer.toString(rand.nextInt(10));
            numStr+=ran;
        }
		
        return numStr;
	}
	
}
