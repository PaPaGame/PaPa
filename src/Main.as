package
{
	import com.shrimp.framework.core.ApplicationBase;
	import com.shrimp.framework.managers.LayerManager;
	import com.shrimp.framework.managers.StageManager;
	import com.shrimp.framework.ui.controls.Button;
	import com.shrimp.papa.game.buff.BuffList;
	
	import demo.ABSelectorDemo;
	
	import demo2.BuffDemo;
	
	import flash.events.Event;
	import flash.events.MouseEvent;

	/**
	 *
	 * @author Sol
	 *
	 */
	[SWF(frameRate="30",backgroundColor="#c0c0c0")]
	public class Main extends ApplicationBase
	{
		public function Main()
		{
			super();
			addEventListener(Event.ENTER_FRAME, onEnter);
		}

		private var list:BuffList;
		protected function onEnter(event:Event):void
		{
			
			removeEventListener(Event.ENTER_FRAME, onEnter);
			StageManager.init(this);
			LayerManager.lazyInit();
			
//			ViewManager.regView(ViewType.WELCOME,ViewWelcome);
//			
//			ViewManager.getInstance().view = ViewType.WELCOME;
			
			list = new BuffList();
			
			var btn:Button = new Button(this);
			btn.label = "aaaaa"
			btn.addEventListener(MouseEvent.CLICK,onMouseClick);
			
//			var sp:Splash = new Splash("assets/splash/splash.swf",onInit,2000);
//			LayerManager.getLayerByName(LayerManager.LAYER_VIEW).addChild(sp);
			
//			PapaCore.eventSender.addEventListener(GameEvent.GAME_INIT, onInit);
//			PapaCore.getInstance().init();
//			PapaCore.getInstance().start();
		}
		
		protected function onMouseClick(event:MouseEvent):void
		{
//			addChild(new UIView());
//			addChild(new ABSelectorDemo());
			addChild(new BuffDemo());
		}
		
//		protected function onInit(event:Event=null):void
//		{
//			trace("hello");
//		}
	}
}
