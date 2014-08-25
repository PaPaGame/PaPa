package com.shrimp.papa.core
{
	import com.shrimp.framework.log.Logger;
	import com.shrimp.papa.game.constant.GameEvent;
	import com.shrimp.papa.interfaces.IRender;

	import flash.display.Shape;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.utils.Dictionary;
	import flash.utils.getTimer;

	/**
	 *
	 * @author Sol
	 *
	 */
	public class PapaCore implements IRender
	{
		public static var eventSender:EventDispatcher=new EventDispatcher();
		/**	计数器*/
		private static const ticker:Shape=new Shape();
		/**	引擎是否初始化*/
		public static var initialized:Boolean=false;
		/**	刷新列表,存放在该列表内的对象,均实现了. IRender接口*/
		private static var renderMap:Dictionary;

		private static var _instance:PapaCore;

		public static function getInstance():PapaCore
		{
			if (!_instance)
			{
				_instance=new PapaCore();
			}

			return _instance;
		}

		public function PapaCore()
		{
			_instance=this;
		}

		public function init():void
		{
			renderMap=new Dictionary();

			initialized=true;
			eventSender.dispatchEvent(new GameEvent(GameEvent.GAME_INIT));
		}

		/**	向引擎中, 注册渲染器*/
		public static function regRender(key:String, render:IRender):void
		{
			if (renderMap[key] != null)
			{
				Logger.getLogger("PaPa Core").warning("already existed,key:", key, ",IRender:", render);
				return;
			}

			renderMap[key]=render;
		}

		public static function unregRender(key:String):void
		{
			if (renderMap[key] == null)
			{
				Logger.getLogger("PaPa Core").warning("no key:", key, " in keymap");
				return;
			}
			//从渲染列表中 找出来 想要删除的 渲染器.释放后再删除
			var render:IRender=renderMap[key] as IRender;
			render.destory();
			delete renderMap[key];
		}

		/**
		 *	销毁 
		 * 
		 */		
		public function destory():void
		{
			for each (var render:IRender in renderMap)
			{
				render.destory();
			}

			initialized=false;
			eventSender.dispatchEvent(new GameEvent(GameEvent.GAME_DESTORY));
		}

		public function update(elapsed:Number):void
		{
			for each (var render:IRender in renderMap)
			{
				render.update(elapsed);
			}
		}

		public function getTick():void
		{

		}

		private function onTiker(event:Event):void
		{
			update(getTimer());
		}

		/**	开始*/
		public function start():void
		{
			ticker.addEventListener(Event.ENTER_FRAME, onTiker);
		}

		/**	暂停*/
		public function pause():void
		{
			ticker.removeEventListener(Event.ENTER_FRAME, onTiker);
		}

		/**	恢复*/
		public function resume():void
		{
			ticker.addEventListener(Event.ENTER_FRAME, onTiker);
		}

		/**	停止*/
		public function stop():void
		{
			ticker.removeEventListener(Event.ENTER_FRAME, onTiker);
		}
	}
}
