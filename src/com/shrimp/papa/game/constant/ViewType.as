package com.shrimp.papa.game.constant
{
	/**
	 *	场景 
	 * @author Sol
	 * 
	 */	
	public class ViewType
	{
		private static var BASE:int = 0;
		
		public static var WELCOME:int = ++BASE;
		
		/**
		 *	拿到某个场景的ID, 因为都是++的,所以看起来不好看.
		 * 方便调试
		 * ViewType.getViewType(ViewType.WELCOME); 
		 * @param type
		 * @return 
		 * 
		 */		
		public static function getViewType(type:int):int
		{
			return type;
		}
	}
}