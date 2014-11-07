package
{
	import com.shrimp.framework.managers.StageManager;
	import com.shrimp.framework.ui.controls.Button;
	import com.shrimp.framework.utils.SWFProfiler;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	public class UIView extends Sprite
	{
		private var description:TextField;
		
		public function UIView()
		{
			super();
			
			var btn:Button = new Button(this,StageManager.getStageWidth()-50);
			btn.label = "as";
			btn.addEventListener(MouseEvent.CLICK,onMouseClick);
			
			addEventListener(Event.ENTER_FRAME,onEnter);
		}
		
		protected function onMouseClick(event:MouseEvent):void
		{
			SWFProfiler.init(StageManager.stage,this);
			SWFProfiler.show();
		}
		
		protected function onEnter(event:Event):void
		{
			removeEventListener(Event.ENTER_FRAME,onEnter);

		}
	}
}