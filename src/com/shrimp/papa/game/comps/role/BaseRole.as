package com.shrimp.papa.game.comps.role
{
	import com.shrimp.framework.ui.controls.core.Component;
	
	import flash.display.DisplayObjectContainer;
	
	/**
	 *	人物基类 
	 * @author Sol
	 * 
	 */	
	public class BaseRole extends Component
	{
		public function BaseRole(parent:DisplayObjectContainer=null, xpos:Number=0, ypos:Number=0)
		{
			super(parent, xpos, ypos);
		}
	}
}