package com.shrimp.papa.game.view
{
	import com.shrimp.framework.ui.controls.BaseView;
	import com.shrimp.papa.game.view.welcome.WelcomeBox;
	
	import flash.display.DisplayObjectContainer;
	
	public class ViewWelcome extends BaseView
	{
		public function ViewWelcome(parent:DisplayObjectContainer=null, xpos:Number=0, ypos:Number=0)
		{
			super(parent, xpos, ypos);
		}
		
		private var instance:WelcomeBox;
		
		override protected function endShow():void
		{
			super.endShow();
			instance = new WelcomeBox();
			addChild(instance);
		}
	}
}