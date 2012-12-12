package matt.assets
{
	import flash.display.Bitmap;
	import flash.utils.getDefinitionByName;
	
	import starling.display.Image;
	import starling.display.Sprite;

	public class R
	{
		public static const CENTER:String = "CENTER";
		
		public static const TOP_LEFT:String = "TOP_LEFT";
		public static const TOP_MIDDLE:String = "TOP_MIDDLE";
		public static const TOP_RIGHT:String = "TOP_RIGHT";
		
		public static const BOTTOM_LEFT:String = "BOTTOM_LEFT";
		public static const BOTTOM_MIDDLE:String = "BOTTOM_MIDDLE";
		public static const BOTTOM_RIGHT:String = "BOTTOM_RIGHT";
		
		public function R()
		{
		}
		
		public static function get( imgClass:Class, transformationPoint:String = CENTER ):Bitmap
		{
			var bmp:Bitmap = new imgClass();
			bmp.smoothing = true;
			
			switch( transformationPoint )
			{
				case TOP_LEFT:
				{
					bmp.x = 0;
					bmp.y = 0;
					
					break;
				}
				case CENTER:
				{
					bmp.x = - ( bmp.width >> 1 );
					bmp.y = - ( bmp.height >> 1 );
					
					break;
				}
					
				default:
				{
					break;
				}
			}
			
			return bmp;
		}
		
		public static function getStarlingImage( imgClass:Class, transformationPoint:String = CENTER ):Image
		{
			var img:Image = Image.fromBitmap( get( imgClass, TOP_LEFT ) );
			
			switch( transformationPoint )
			{
				case CENTER:
				{
					img.pivotX = img.width >> 1;
					img.pivotY = img.height >> 1;
					
					break;
				}
					
				case TOP_LEFT:
				{
					img.pivotX = 0;
					img.pivotY = 0;
					
					break;
				}
				case TOP_MIDDLE:
				{
					img.pivotX = img.width >> 1;
					img.pivotY = 0;
					
					break;
				}
				case TOP_RIGHT:
				{
					img.pivotX = img.width;
					img.pivotY = 0;
					
					break;
				}
					
				case BOTTOM_LEFT:
				{
					img.pivotX = 0;
					img.pivotY = img.height;
					
					break;
				}
				case BOTTOM_MIDDLE:
				{
					img.pivotX = img.width >> 1;
					img.pivotY = img.height;
					
					break;
				}
				case BOTTOM_RIGHT:
				{
					img.pivotX = img.width;
					img.pivotY = img.height;
					
					break;
				}
					
				default:
				{
					break;
				}
			}
			
			return img;
		}
		
		public static function getStarlingSprite( imgClass:Class, transformationPoint:String = CENTER ):Sprite
		{
			var starlingSprite:Sprite = new Sprite();
			starlingSprite.addChild(
				Image.fromBitmap( get( imgClass, transformationPoint ) )
			);
			
			return starlingSprite;
		}
	}
}