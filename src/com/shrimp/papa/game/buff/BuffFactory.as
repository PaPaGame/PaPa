package com.shrimp.papa.game.buff
{
	import com.shrimp.papa.game.buff.add.BuffCoin;
	import com.shrimp.papa.game.buff.add.BuffScore;
	import com.shrimp.papa.game.buff.add.BuffSubDropSpeed;
	import com.shrimp.papa.game.buff.add.BuffSubUpSpeed;
	
	import flash.errors.IllegalOperationError;
	import flash.utils.Dictionary;

	/**
	 *	Buff工厂用来产生Buff,用之前,先通过buildFactory进行工厂建立. 
	 * @author Sol
	 * 
	 */	
	public class BuffFactory
	{
		private static var dic:Dictionary;
		
		public function BuffFactory()
		{
		}
		
		public static function buildFactory():void
		{
			dic = new Dictionary();
			
			//得分buff
			dic[BuffType.BUFF_ADD_SCORE] = BuffScore;
			//金币加成buff
			dic[BuffType.BUFF_ADD_COIN] = BuffCoin;
			//减速上升buff
			dic[BuffType.BUFF_SUB_UP_SPEED] = BuffSubUpSpeed;
			//减速下降buff
			dic[BuffType.BUFF_SUB_DROP_SPEED] = BuffSubDropSpeed;
			
		}
		
		//根据策略生成buff
		/**	创建一个buff*/
		public static function genBuff(type:int):IBuff
		{
			if(null==dic[type])
			{
				throw new IllegalOperationError("不存在此类型的buff,type:",type);
			}
			
			return new dic[type];
		}
	}
}