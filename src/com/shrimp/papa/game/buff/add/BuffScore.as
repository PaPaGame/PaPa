package com.shrimp.papa.game.buff.add
{
	import com.shrimp.papa.game.buff.BaseBuff;
	import com.shrimp.papa.game.buff.BuffSuperType;
	import com.shrimp.papa.game.buff.BuffType;
	import com.shrimp.papa.game.buff.IBuff;
	
	/**
	 *	得分加成buff 
	 * @author Sol
	 * 
	 */	
	public class BuffScore extends BaseBuff
	{
		public function BuffScore()
		{
			super();
		}
		
		override public function get type():int
		{
			return BuffType.BUFF_ADD_SCORE;
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