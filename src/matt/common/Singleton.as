package matt.common 
{
	public class Singleton
	{
		private static var _instance:Singleton;
		
		public function Singleton(s:SingletonEnforcer)
		{
			if (!s) throw new Error( "Error: Instantiation failed: Use getInstance() instead of new." );
		}
		
		public static function getInstance():Singleton
		{
			if( !_instance )
				return _instance = new Singleton( new SingletonEnforcer() );
			else
				return _instance;
		}
	}
}

class SingletonEnforcer{}