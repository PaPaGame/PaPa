package demo2
{
	import com.shrimp.framework.ui.container.Box;
	import com.shrimp.framework.ui.container.HBox;
	import com.shrimp.framework.ui.controls.Button;
	import com.shrimp.papa.game.buff.BuffFactory;
	import com.shrimp.papa.game.buff.BuffList;
	import com.shrimp.papa.game.buff.BuffType;
	
	import flash.display.DisplayObjectContainer;
	import flash.display.Shape;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.utils.getTimer;
	
	public class BuffDemo extends Box
	{
		public function BuffDemo(parent:DisplayObjectContainer=null, xpos:Number=0, ypos:Number=0)
		{
			super(parent, xpos, ypos);
		}
		
		override protected function createChildren():void
		{
			super.createChildren();
			
			var hb:HBox = new HBox(this);
			var btn:Button = new Button(hb);
			btn.label = "aaa";
			btn.addEventListener(MouseEvent.CLICK,onBtnClick);
			
			BuffFactory.buildFactory();
			
			list = new BuffList();
			
			sp = new Shape();
			sp.addEventListener(Event.ENTER_FRAME,onEnter);
		}
		
		protected function onEnter(event:Event):void
		{
			list.update(getTimer());
		}
		
		private var sp:Shape;
		
		private var list:BuffList;
		
		protected function onBtnClick(event:MouseEvent):void
		{
			list.addBuff(BuffFactory.genBuff(BuffType.BUFF_ADD_COIN));
		}
	}
}