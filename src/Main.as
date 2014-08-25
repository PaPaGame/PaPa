package
{
	import com.shrimp.framework.core.ApplicationBase;
	import com.shrimp.framework.managers.LayerManager;
	import com.shrimp.framework.managers.StageManager;
	import com.shrimp.papa.core.PapaCore;
	import com.shrimp.papa.game.constant.GameEvent;
	import com.shrimp.papa.game.view.GameLoader;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;

	/**
	 *
	 * @author Sol
	 *
	 */
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
//			PapaCore.eventSender.addEventListener(GameEvent.GAME_INIT, onInit);
//			PapaCore.getInstance().init();
//			PapaCore.getInstance().start();
		}

//		protected function onInit(event:Event):void
//		{
//			trace("hello");
//		}
	}
}
