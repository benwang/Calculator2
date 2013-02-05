Calculator
Benjamin Wang

import java.util.Set;
import java.util.TreeSet;


public class Calculator {
  //not sure if we're supposed to do something more dynamic with, say, a BufferedReader/Scanner
	//but given the specs, I feel that this is reasonable: passing an input into a calculator
	//these methods could also be dynamically applied if needed
	
	private String in = null;
	private char[] charArr = null;
	private TreeSet<Character> operations = new TreeSet<Character>();
	private TreeSet<Character> digits = new TreeSet<Character>();

	
	public Calculator(String input) {
		in = input;
		try {
			if (input == null) {
				throw new NullPointerException();
			}
			else {
				charArr=input.toCharArray();
			}
		}
		catch(NullPointerException e) {
			System.err.println("Input is null--please enter value");
		}
		operations.add('+'); operations.add('-'); operations.add('*'); 
		operations.add('/'); operations.add('^'); operations.add('.');
		digits.add('1'); digits.add('2'); digits.add('3');
		digits.add('4'); digits.add('5'); digits.add('6');
		digits.add('7'); digits.add('8'); digits.add('9');
		digits.add('p'); digits.add('e'); 
		//represent pi with p
	}
	
	public void clearInput() {
		in = "";
		charArr = in.toCharArray();
	}
	
	public void deleteLast() {
		if (in.length() == 0) {
			return;
		}
		else {
			char[] deletedLast = new char[charArr.length - 1];
			for (int i = 0; i < deletedLast.length - 1; i++) {
				deletedLast[i] = charArr[i];
			}
			
			in = new String(deletedLast);
			charArr = deletedLast;
		}
	}
	
	public void addOn(String edit) {
		in = in + edit;
		charArr = in.toCharArray();
	}
	
	public double execute() {
		//check for valid input
		for (int j = 0; j < in.length(); j++) {
			if (!operations.contains(charArr[j]) && !digits.contains(charArr[j])) {
				System.err.println("Invalid input");
			}
		}
		
		//At this point, I don't want to spend a million hours writing this code in Java with
		//out know what is and isn't translatable to Objective C next week.  
		//So it's gonna be psuedocode from now on:
		
		//1) I will parse the string, breaking each component into "tokens" either defined as
		//operation strings or blocks of "values" (i.e. "+" "^" "/" "3.5" "4" "14432")
		//1b) If you see a '-' and the "before" token is not an operation token,
		//then combine it with the forthcoming value as a negative sign
		//1c) If you see "e" or "p", similarly separate it as a token
		
		//2) Next, I will look at order of operations: ^, * and /, +, -.  I will make a 
		//recursive (or iterative) function that will cycle through the operations combining
		//terms in front and behind it until you are left with one value, the base case.
		//Go through the "line" object adding tokens back in when you combine them together
		//(i.e. 5 + 4 ^ 3 - 4 ==> 5 + 64 - 4 ==> 69 - 4 ==> 65)
		//2b) If you see a '.', be sure then to trigger "parseDouble" otherwise, use "parseInt"
		//to get the values embedded in the strings and use Java to combine the two values together
		//as a double
		
		//2c) If you see a p, then use the math library function to retrieve pi; likewise for e
		//2d) If you divide by zero, then return "NaN"
	}
	
	
	

}
