package com.shrimp.papa.game.buff
{
	public interface IBuff
	{
		/**	设置buff ID*/
		function get id():int;
		
		/**	得到buff子类型*/
		function get type():int;
		
		/**	得到主类型,分为:1:加成,2:触发,3:磁铁,4:护盾,5:抽奖*/
		function get superType():int;
		
		/**	持续时间,单位:ms*/
		function set duration(value:Number):void;
		function get duration():Number;
		
		/**	更新buff*/
		function update(t:Number):void;
		
		/**	buff叠加*/
		function overlay(buff:IBuff):IBuff;
	}
}