package matt.vector
{
	public class RandomizeVector
	{
		public var o:Vector;
		public var n:Vector;
		
		public function RandomizeVector( v:Vector )
		{
			o = v;
		}
		
		public function getRandom():Vector
		{
			n = new Vector();
			
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