package matt.events
{
	import flash.events.Event;
	
	public class GameEvent extends Event
	{
		public static const COMPLETE:String = "COMPLETE";
		
		public var win:Boolean;
		
		public function GameEvent( type:String )
		{
			super( type );
		}
	}
}