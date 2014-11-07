package com.shrimp.papa.game.buff.add
{
	import com.shrimp.papa.game.buff.BaseBuff;
	import com.shrimp.papa.game.buff.BuffSuperType;
	import com.shrimp.papa.game.buff.BuffType;
	import com.shrimp.papa.game.buff.IBuff;
	
	/**
	 *	金币加成buff 
	 * @author Sol
	 * 
	 */	
	public class BuffCoin extends BaseBuff
	{
		public function BuffCoin()
		{
			super();
		}
		
		override public function get type():int
		{
			return BuffType.BUFF_ADD_COIN;
		}
		
		override public function get superType():int
		{
			return BuffSuperType.SUPER_ADD;
		}
		
		override public function overlay(buff:IBuff):IBuff
		{
			duration += buff.duration;
			return this;
		}
		
		override public function update(t:Number):void
		{
			super.update(t);
		}
	}
}