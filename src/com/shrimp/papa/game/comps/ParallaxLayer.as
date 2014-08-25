package com.shrimp.papa.game.comps
{
	import com.shrimp.framework.ui.container.Container;
	import com.shrimp.papa.interfaces.IRender;
	
	import flash.display.DisplayObjectContainer;
	/**
	 * 
	 * @author Sol
	 * 
	 */	
	public class ParallaxLayer extends Container implements IRender
	{
		public function ParallaxLayer(parent:DisplayObjectContainer=null, xpos:Number=0, ypos:Number=0)
		{
			super(parent, xpos, ypos);
		}
		
		public function update(elapsed:Number):void
		{
			
		}
	}
}