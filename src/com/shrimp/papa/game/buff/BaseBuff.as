package com.shrimp.papa.game.buff
{
	/**
	 *	基于时间 时长的buff基类 
	 * @author Sol
	 * 
	 */	
	public class BaseBuff implements IBuff
	{
		/**	buff持续时长*/
		protected var _duration:Number;
		
		public function BaseBuff()
		{
		}
		
		public function set duration(value:Number):void
		{
			if(value < 0)
			{
				value = 0;
			}
			
			_duration = value;
		}
		
		public function get duration():Number
		{
			return _duration;
		}
		
		public function update(t:Number):void
		{
			duration-=t;
		}
		
		public function overlay(buff:IBuff):IBuff
		{
			return buff;
		}
		
		public function get id():int
		{
			return 0;
		}
		
		public function get type():int
		{
			return 0;
		}
		
		public function get superType():int
		{
			return 0;
		}
	}
}