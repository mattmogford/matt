package matt.number
{
	public class Rotation
	{
		public function Rotation()
		{
		}
		
		public static function toRadians(a:Number):Number {
			return a*Math.PI/180;
		}
		
		public static function toDegrees(a:Number):Number {
			return a*180/Math.PI
		}
	}
}