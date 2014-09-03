package com.shrimp.papa.game.comps.block
{
	import com.shrimp.framework.ui.controls.core.Component;
	
	import flash.display.DisplayObjectContainer;
	
	/**
	 *	基础块 
	 * @author Sol
	 * 
	 */	
	public class BaseBlock extends Component
	{
		public function BaseBlock(parent:DisplayObjectContainer=null, xpos:Number=0, ypos:Number=0)
		{
			super(parent, xpos, ypos);
		}
	}
}