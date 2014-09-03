package com.shrimp.papa.game.comps.coin
{
	import com.shrimp.framework.ui.controls.core.Component;
	
	import flash.display.DisplayObjectContainer;
	
	/**
	 *	钱币基类 
	 * @author Sol
	 * 
	 */	
	public class BaseCoin extends Component
	{
		public function BaseCoin(parent:DisplayObjectContainer=null, xpos:Number=0, ypos:Number=0)
		{
			super(parent, xpos, ypos);
		}
	}
}