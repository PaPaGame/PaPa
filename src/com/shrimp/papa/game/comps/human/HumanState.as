package com.shrimp.papa.game.comps.human
{
	/**
	 *	人物状态类 
	 * @author Sol
	 * 
	 */	
	public class HumanState
	{
		/**	闲置状态*/
		public static const IDLE:int = 1;
		
		/**	上升状态*/
		public static const UP:int = 2;
		
		/**	下降状态*/
		public static const DOWN:int = 3;
		
		/**	死亡状态*/
		public static const DIE:int = 4;
		
		public function HumanState()
		{
		}
	}
}