package matt.display
{
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.ProgressEvent;
	import flash.net.URLRequest;
	
	import matt.events.BitmapLoaderEvent;
	
	public class ImageLoader extends EventDispatcher
	{
		private var imageLoader:Loader;
		
		public function ImageLoader( url:String )
		{
			super();
			
			imageLoader = new Loader();
			imageLoader.load( new URLRequest( url ) );
			imageLoader.contentLoaderInfo.addEventListener( ProgressEvent.PROGRESS, imageLoading );
			imageLoader.contentLoaderInfo.addEventListener( Event.COMPLETE, imageLoaded );
		}
		
		private function imageLoaded(e:Event):void
		{
			var imgEvent:BitmapLoaderEvent = new BitmapLoaderEvent( BitmapLoaderEvent.COMPLETE );
			imgEvent.bmp = Bitmap( imageLoader.content );
			this.dispatchEvent( imgEvent );
		}
		
		private function imageLoading(e:ProgressEvent):void
		{
			// Use it to get current download progress
			// Hint: You could tie the values to a preloader :)
		}
	}
}