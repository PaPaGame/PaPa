package com.shrimp.papa.game.comps.human
{
	import com.shrimp.papa.game.buff.IBuff;

	public interface IHuman
	{
		/**	添加buff,如果已有,则overlay*/
		function addBuff(buff:IBuff):void;
		/**	*/
		function updateBuff(t:Number):void;
		/**	拿到人物状态*/
		function set state(value:int):void;
		function get state():int;
	}
}