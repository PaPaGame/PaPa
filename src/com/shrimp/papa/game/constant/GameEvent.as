package com.shrimp.papa.game.constant
{
	import flash.events.Event;
	/**
	 * 
	 * @author Sol
	 * 
	 */	
	public final class GameEvent extends Event
	{
		protected static const base:String = "papa_core_";
		
		/**	引擎初始化信息*/
		public static var GAME_INIT:String = base + "init";
		
		/**	引擎销毁*/
		public static var GAME_DESTORY:String = base + "destory";
		
		public function GameEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}