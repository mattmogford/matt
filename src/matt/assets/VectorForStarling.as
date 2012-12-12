package matt.assets
{
	import matt.DynamicTextureAtlasGenerator.DynamicAtlas;
	
	import starling.textures.TextureAtlas;

	public class VectorForStarling
	{
		private var _assetsVector:Vector.<Class>;
		private var _textureAtlas:TextureAtlas;
		
		public function VectorForStarling( vectorClass:Class, scaleFactor:Number, margin:uint = 0, preserveColor:Boolean = true, checkBounds:Boolean = false )
		{
			_assetsVector = new Vector.<Class>();
			_assetsVector.push( vectorClass ); //WARNING - MUST HAVE 2+ FRAMES TO AVOID ERRORS
			
			_textureAtlas = DynamicAtlas.fromClassVector(
				_assetsVector, scaleFactor, 0, true, false
			);
			
			_assetsVector = null;
		}
		
		public function get textureAtlas():TextureAtlas
		{
			return _textureAtlas;
		}
	}
}