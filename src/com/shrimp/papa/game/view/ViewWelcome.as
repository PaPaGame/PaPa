package com.shrimp.papa.game.view
{
	import com.shrimp.framework.ui.controls.BaseView;
	
	import flash.display.DisplayObjectContainer;
	
	public class ViewWelcome extends BaseView
	{
		public function ViewWelcome(parent:DisplayObjectContainer=null, xpos:Number=0, ypos:Number=0)
		{
			super(parent, xpos, ypos);
		}
		
		override protected function showing():void
		{
			super.showing();
			trace("呈现");
		}
	}
}