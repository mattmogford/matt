package matt.array
{
	public class RandomizeArray
	{
		public var o:Array;
		public var n:Array;

		public function RandomizeArray( array:Array )
		{
			o = array;
		}

		public function getRandom():Array
		{
			
			n = new Array( o.length );
			
			var randomPos:Number = 0;
			for ( var i:int = 0; i < n.length; i++ )
			{
				randomPos = int( Math.random() * o.length );
				n[i] = o.splice(randomPos, 1)[0];
			}
			
			return n;
		}
	}
}