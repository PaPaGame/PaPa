package com.shrimp.papa.game.buff
{
	/**
	 *	buff主类型 枚举值 
	 * @author Sol
	 * 
	 */	
	public class BuffSuperType
	{
		public function BuffSuperType()
		{
		}
		
		/**	加成类型*/
		public static const SUPER_ADD:int = 1;
		
		/**	触发类型*/
		public static const SUPER_TRIGGER:int = 2;
		
		/**	磁铁类型*/
		public static const SUPER_MAGNET:int = 3;
		
		/**	护盾类型*/
		public static const SUPER_SHIELD:int = 4;
		
		/**	抽奖类型*/
		public static const SUPER_LOTTERY:int = 5;
	}
}