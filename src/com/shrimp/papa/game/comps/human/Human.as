package com.shrimp.papa.game.comps.human
{
	import com.shrimp.framework.ui.controls.core.Component;
	import com.shrimp.papa.game.buff.BuffList;
	import com.shrimp.papa.game.buff.IBuff;
	
	import flash.display.DisplayObjectContainer;
	
	/**
	 *	人物类 
	 * @author Sol
	 * 
	 */	
	public class Human extends Component implements IHuman
	{
		
		protected var buffList:BuffList;
		
		public function Human(parent:DisplayObjectContainer=null, xpos:Number=0, ypos:Number=0)
		{
			super(parent, xpos, ypos);
			buffList = new BuffList();
			buffList.clear();
		}
		
		public function addBuff(buff:IBuff):void
		{
			buffList.addBuff(buff);
		}
		
		public function updateBuff(t:Number):void
		{
			buffList.update(t);
		}

		
		private var _state:int;
		public function get state():int
		{
			return _state;
		}

		public function set state(value:int):void
		{
			_state = value;
		}
	}
}