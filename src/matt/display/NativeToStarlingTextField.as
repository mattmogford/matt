package matt.display
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.AntiAliasType;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	import flashx.textLayout.formats.TextAlign;
	
	public class NativeToStarlingTextField extends Sprite
	{
		public var textfield:TextField;
		private var _format:TextFormat;
		
		public function NativeToStarlingTextField( width:Number, height:Number, text:String, fontName:String, fontSize:Number = 19,
												   color:uint = 0x000000, bold:Boolean = false, border:Boolean = false,
												   borderColor:uint = 0x000000, align:String = TextFormatAlign.CENTER )
		{
			super();
			
			textfield = new TextField();
			textfield.width 			= width;
			textfield.height 			= height;
			textfield.border			= border;
			textfield.borderColor 	= borderColor;
			textfield.antiAliasType 	= AntiAliasType.ADVANCED;
			textfield.type 			= TextFieldType.INPUT;
			
			_format = new TextFormat();
			_format.font 	= fontName;
			_format.size 	= fontSize;
			_format.color 	= color;
			_format.bold	= bold;
			_format.align   = align;
		
			textfield.defaultTextFormat = _format;
			textfield.text = text;
			
			this.addChild( textfield );
			textfield.addEventListener( MouseEvent.MOUSE_DOWN, clickedTextfield );
		}
		
		protected function clickedTextfield(event:MouseEvent):void
		{
			textfield.text = "";
		}
	}
}