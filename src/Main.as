package
{
	import com.shrimp.framework.core.ApplicationBase;
	import com.shrimp.framework.managers.LayerManager;
	import com.shrimp.framework.managers.StageManager;
	import com.shrimp.papa.core.PapaCore;
	import com.shrimp.papa.game.constant.GameEvent;
	import com.shrimp.papa.game.view.GameLoader;
	import com.shrimp.papa.game.view.Splash;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;

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
			var sp:Splash = new Splash("assets/splash/splash.swf",onInit,2000);
			addChild(sp);
//			PapaCore.eventSender.addEventListener(GameEvent.GAME_INIT, onInit);
//			PapaCore.getInstance().init();
//			PapaCore.getInstance().start();
		}

		protected function onInit(event:Event=null):void
		{
			trace("hello");
		}
	}
}
