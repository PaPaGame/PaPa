package components
{
	import com.shrimp.framework.ui.container.Container;
	import com.shrimp.framework.ui.controls.Image;
	import com.shrimp.framework.ui.controls.Label;
	
	import flash.display.DisplayObjectContainer;
	import flash.events.Event;
	import flash.geom.Rectangle;

	/**
	 *	进度条
	 * @author Sol
	 *
	 */
	[Event(name="complete", type="flash.events.Event")]
	public class ProgressBar extends Container
	{
		/**	边框*/
		[Embed(source = "/assets/progressBarBorder.png")]
		public static const border:Class;

		/**	内框*/
		[Embed(source = "/assets/inner.png")]
		public static const inner:Class;

		public function ProgressBar(parent:DisplayObjectContainer = null, xpos:Number = 0, ypos:Number = 0)
		{
			super(parent, xpos, ypos);
		}

		private var imgBg:Image;
		private var imgInner:Image;
		private var lblValue:Label;

		override protected function createChildren():void
		{
			super.createChildren();
			imgBg = new Image(this);
			imgBg.scale9Rect = new Rectangle(10,10,20,10);
			imgBg.source = border;

			imgInner = new Image(this,5,5);
			imgInner.scale9Rect = new Rectangle(1,1,20,20);
			imgInner.source = inner;

			lblValue = new Label(this);
		}

		override public function set width(value:Number):void
		{
			imgBg.width = imgInner.width = value;
			super.width = value;
		}

		override public function set height(value:Number):void
		{
			imgBg.height = imgInner.height = value;
			super.height = value;
		}

		/**	进度条的值*/
		public function get value():Number
		{
			return _value;
		}

		public function set value(value:Number):void
		{
			_value = value;
			invalidateDisplayList();
			if(hasEventListener(Event.COMPLETE) && value>=1)
			{
				dispatchEvent(new Event(Event.COMPLETE));
			}
		}

		private var _value:Number = 0;

		override protected function updateDisplayList():void
		{
			super.updateDisplayList();
			lblValue.text = (value*100).toFixed(2) + "%";
			lblValue.x = this.width - lblValue.width >> 1;
			lblValue.y = this.height - lblValue.height >> 1;
			imgInner.width = Math.max(value *( this.width-10),1);
		}
	}
}
