package matt.number
{
	public class Random
	{
		public function Random()
		{
		}
		
		public static function inRange( a:Number, b:Number ):Number
		{
			var n:Number = ( Math.random() * (b + 1) ) + a;
			return n;
		}
		
		public static function getRandDecimal( min:int, max:int, decimalPlaces:int ):Number
		{
			var val:Number = 0;
			while( val == 0 )
			{
				val = int( inRange( -min, max ) )
				if( decimalPlaces == 1 )
					val *= 0.1;
				else if( decimalPlaces == 2 )
					val *= 0.01;
				else
					return val;
			}
			
			if( ! Random.inRange( 0, 1 ) )
				val -= val * 2;
			
			return val;
		}
	}
}