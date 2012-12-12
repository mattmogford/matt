package matt.assets
{
	import starling.extensions.ParticleDesignerPS;
	import starling.textures.Texture;

	public class Anims
	{
		public function Anims()
		{
		}
		
		public static function get( animXML:Class, animTexture:Class ):ParticleDesignerPS
		{
			var anim:ParticleDesignerPS = new ParticleDesignerPS( 
				XML( new animXML() ),
				Texture.fromBitmap( new animTexture() )
			);
			
			return anim;
		}
	}
}