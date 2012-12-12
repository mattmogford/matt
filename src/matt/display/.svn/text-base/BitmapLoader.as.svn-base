package matt.display
{	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.utils.ByteArray;
	
	import matt.events.BitmapLoaderEvent;
	import matt.text.Filename;
	
	[Event( name="startDownloading", 	type="matt.events.BitmapLoaderEvent" )]
	[Event( name="loading",				type="matt.events.BitmapLoaderEvent" )]
	[Event( name="finishDownloading",	type="matt.events.BitmapLoaderEvent" )]
	[Event( name="fileSaved", 			type="matt.events.BitmapLoaderEvent" )]
	[Event( name="fileOpened", 			type="matt.events.BitmapLoaderEvent" )]
	[Event( name="complete", 			type="matt.events.BitmapLoaderEvent" )]	
	
	public class BitmapLoader extends Bitmap
	{
		private var _url:String;
		private var _cacheDir:File;
		
		private var _urlLoader:URLLoader;
		private var _fName:String;
		private var _fs:FileStream;
		private var _f:File;
		
		private var _blEvent:BitmapLoaderEvent;
		
		public function BitmapLoader( url:String, cacheDir:File )
		{
			super(null, "auto", true);
			
			_url = url;
			_cacheDir = cacheDir;
			_fName = new Filename().getFilenameFromUrl( _url );
			
			init();
		}
		
		private function init():void
		{
			if(_fName != '') {
				_f = _cacheDir.resolvePath( _fName );	
				_fs = new FileStream();
				if ( _f.exists )
					this.openImg();
				else
					this.downloadImg();
			}
		}
		
		private function downloadImg():void
		{
			
			fire( BitmapLoaderEvent.START_DOWNLOADING );

			_urlLoader = new URLLoader();
			_urlLoader.dataFormat = URLLoaderDataFormat.BINARY;
			_urlLoader.addEventListener( Event.COMPLETE, imgDLComplete );
			_urlLoader.addEventListener( ProgressEvent.PROGRESS, imgDLProgress );
			
			_urlLoader.load( new URLRequest( _url ) );
		}
		
		private function imgDLProgress( progressEvent:ProgressEvent ):void
		{
			fire( BitmapLoaderEvent.LOADING, progressEvent );
		}
		
		private function imgDLComplete( e:Event ):void
		{
			_urlLoader.removeEventListener( Event.COMPLETE, imgDLComplete );
			_urlLoader.removeEventListener( ProgressEvent.PROGRESS, imgDLProgress );
			
			fire( BitmapLoaderEvent.FINISH_DOWNLOADING );
			
			this.saveImg( e.target.data );
		}
		
		private function saveImg( data:ByteArray ):void {
			_fs.open( _f, FileMode.WRITE );
			_fs.writeBytes( data, 0, data.bytesAvailable );			
			_fs.close();
			
			fire( BitmapLoaderEvent.FILE_SAVED );
			
			this.openImg();
		}
		
		private function openImg():void
		{
			var ba:ByteArray = new ByteArray();
			var loader:Loader = new Loader();
			
			_fs.open( _f, FileMode.READ );
			_fs.readBytes( ba );			
			_fs.close();
			
			fire( BitmapLoaderEvent.FILE_OPENED );
			
			loader.contentLoaderInfo.addEventListener( Event.COMPLETE, applyBitmapData );
			loader.loadBytes( ba );
		}
		
		private function applyBitmapData(e:Event):void {			
			var decodedBitmapData:BitmapData = Bitmap( e.target.content ).bitmapData;
			this.bitmapData = decodedBitmapData;
			
			fire( BitmapLoaderEvent.COMPLETE );
		}
		
		private function fire(type:String, progress:ProgressEvent = null):void
		{
			if(this.hasEventListener(type)) { //only if something is listening for this event will the event fire
				_blEvent = new BitmapLoaderEvent( type );
				_blEvent.progress = progress;
				this.dispatchEvent( _blEvent );
			}
		}
	}
}