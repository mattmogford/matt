package matt.text
{
	public class Filename
	{
		public function Filename() 
		{
		}
				
		public function getFilenameFromUrl(url:String):String
		{
			var letters:Array = [];
			var charPosition:int = url.length;
			var currentCharacter:String;
			var filename:String;
			
			while(currentCharacter != '/' && currentCharacter != '\\') {
				currentCharacter = url.charAt(charPosition);
				letters.push( currentCharacter);
				charPosition--;
			}
			letters = letters.reverse();
			letters.shift();
			filename = letters.join('');
			
			return filename;
		}
	}
}