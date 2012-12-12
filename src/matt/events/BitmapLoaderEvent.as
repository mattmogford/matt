package matt.events
{
	import flash.display.Bitmap;
	import flash.events.Event;
	import flash.events.ProgressEvent;
	
	public class BitmapLoaderEvent extends Event
	{
		public static const START_DOWNLOADING:String 	= "startDownloading";
		public static const LOADING:String 				= "loading";
		public static const FINISH_DOWNLOADING:String 	= "finishDownloading";
		public static const FILE_SAVED:String 			= "fileSaved";
		public static const FILE_OPENED:String 			= "fileOpened";
		public static const COMPLETE:String 			= "complete";
		
		public var progress:ProgressEvent = null;
		public var bmp:Bitmap;
		
		public function BitmapLoaderEvent( type:String, bubbles:Boolean=false, cancelable:Boolean=false )
		{
			super( type, bubbles, cancelable );
		}
	}
}