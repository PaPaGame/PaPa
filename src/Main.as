package
{
	import com.shrimp.framework.core.ApplicationBase;
	import com.shrimp.framework.managers.LayerManager;
	import com.shrimp.framework.managers.StageManager;
	import com.shrimp.framework.managers.ViewManager;
	import com.shrimp.framework.ui.controls.Button;
	import com.shrimp.papa.game.constant.ViewType;
	import com.shrimp.papa.game.view.ViewWelcome;
	
	import flash.events.Event;
	import flash.events.MouseEvent;

	/**
	 *
	 * @author Sol
	 *
	 */
	[SWF(frameRate="60",backgroundColor="#000000")]
	public class Main extends ApplicationBase
	{
		public function Main()
		{
			super();
			addEventListener(Event.ENTER_FRAME, onEnter);
		}

		protected function onEnter(event:Event):void
		{
			
			removeEventListener(Event.ENTER_FRAME, onEnter);
			StageManager.init(this);
			LayerManager.lazyInit();
			
			ViewManager.regView(ViewType.WELCOME,ViewWelcome);
			
			ViewManager.getInstance().view = ViewType.WELCOME;
			
			var btn:Button = new Button(this);
			btn.addEventListener(MouseEvent.CLICK,onMouseClick);
			
//			var sp:Splash = new Splash("assets/splash/splash.swf",onInit,2000);
//			LayerManager.getLayerByName(LayerManager.LAYER_VIEW).addChild(sp);
			
//			PapaCore.eventSender.addEventListener(GameEvent.GAME_INIT, onInit);
//			PapaCore.getInstance().init();
//			PapaCore.getInstance().start();
		}
		
		protected function onMouseClick(event:MouseEvent):void
		{
		}
		
//		protected function onInit(event:Event=null):void
//		{
//			trace("hello");
//		}
	}
}
