package matt.ui.components
{
	import starling.animation.Transitions;
	import starling.animation.Tween;
	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.filters.BlurFilter;
	import starling.text.TextField;
	
	public class Button extends Sprite
	{		
		private var _origWidth:Number;
		private var _origHeight:Number;
		private var _skin:DisplayObject;

		private var _tf:TextField;
		private var _onlyGlow:Boolean;
		private var _glowColor:uint;
		private var _expandSize:Number;
		
		public function Button( skin:DisplayObject, text:String = null, fontSize:Number = 19, textColor:uint = 0xffffff, onlyGlow:Boolean = false, padding:Number = 0, topBuffer:Number = 0, glowColor:uint = 0xffffff, expandSize:Number = 0 )
		{
			super();
		
			this.useHandCursor = true;
			
			_skin = skin;
			if( fontSize == 0 ) fontSize = 19;
			_onlyGlow = onlyGlow;
			_skin.alpha = 0.9;
			_skin.y = topBuffer;
			_glowColor = glowColor;
			_expandSize = expandSize;
			this.addChild( _skin );
			_origWidth = this.width;
			_origHeight = this.height;
			
			var btnWidth:Number = _origWidth + ( padding * 2 );			
			var btnHeight:Number = _origHeight + ( padding * 2 );
			var invisBG:Quad = new Quad( btnWidth, btnHeight , 0x00ff00 );
			invisBG.x = -( _origWidth >> 1 ) - padding;
			invisBG.y = -( _origHeight >> 1 ) - padding;
			invisBG.alpha = 0;
			this.addChild( invisBG );
			
			if( text )
			{
				_tf = new TextField( this.width - 10, this.height, text, "Verdana", fontSize, textColor, false );
				_tf.bold = true;
				_tf.border = false;
				_tf.autoScale = true;
				_tf.x = -( _tf.width >> 1 );
				_tf.y = -( _tf.height >> 1 );
				this.addChild( _tf );
			}
			
			addListeners();
		}
		
		public function addListeners():void
		{
			this.addEventListener( TouchEvent.TOUCH, onHover );
		}
		
		private function onHover( e:TouchEvent ):void
		{
			if( e.getTouch(this, TouchPhase.HOVER) )
				expand();
			else
				contract();
		}
		
		private function expand():void
		{
			trace("Button.expand()");
			
			if( !_onlyGlow )
			{
				var expandTween:Tween = new Tween( _skin, 1, Transitions.EASE_OUT_ELASTIC );
				expandTween.animate( "width", _origWidth * _expandSize );
				expandTween.animate( "height", _origHeight * _expandSize );
				expandTween.fadeTo( 1 );
				Starling.juggler.add( expandTween );
			}
			this.filter = BlurFilter.createGlow( _glowColor );
		}
		
		private function contract():void
		{
			if( !_onlyGlow )
			{
				var contractTween:Tween = new Tween( _skin, 1, Transitions.EASE_OUT_ELASTIC );
				contractTween.animate( "width", _origWidth );
				contractTween.animate( "height", _origHeight );
				contractTween.fadeTo( 0.9 );
				Starling.juggler.add( contractTween );
			}
			this.filter = null;
		}
		
		public function get text():String
		{
			return _tf.text;
		}
		
		public function set text( val:String ):void
		{
			_tf.text = val;
		}
	}
}