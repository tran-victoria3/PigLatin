import java.util.*;

public void setup() {
	
	String lines[] = loadStrings("words.txt");
	System.out.println("there are " + lines.length + " lines");
	for (int i = 0 ; i < lines.length; i++) {
		System.out.println(pigLatin(lines[i]));
	}
}
public void draw()
{
}
public int findFirstVowel(String sWord)
//precondition: sWord is a valid String of length greater than 0.
//postcondition: returns the position of the first vowel in sWord.  If there are no vowels, returns -1
{
	char[] vowels = {'a','e','i','o','u'};
	for (int i=0; i<sWord.length(); i++){
		for(int x=0; x<vowels.length; x++){
			if(sWord.charAt(i) == vowels[x]){
				return i;  
			} 
		}
	}
	return -1;
}

public String pigLatin(String sWord)
//precondition: sWord is a valid String of length greater than 0
//postcondition: returns the pig latin equivalent of sWord
{
int checker = findFirstVowel(sWord);

	if(sWord.substring(0,2).equals("qu")){
		return sWord.substring(2,sWord.length()) + "qu" + "ay";
	}  
	else if(checker >= 2){ //to check for two or more consonant in a row in a word
		int p = findFirstVowel(sWord);
		return sWord.substring(p) + sWord.substring(0,p) + "ay";
	}

	else if(checker > 0){ //if the first letter is NOT a vowel
		return sWord.substring(1,sWord.length()) + sWord.substring(0,1) + "ay";
	}
	else if(checker == 0){  //checks if word starts with a vowel
		return sWord + "way";
	}
	else if(checker == -1) //this met condition = there are no vowels in the whole word
	{
		return sWord + "ay";
	}
	else
	{
		return "ERROR!"; //unlikely case that there is no word that passes the previous parameters
	}
}
