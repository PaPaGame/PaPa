package com.shrimp.papa.game.view.welcome
{
	import com.shrimp.framework.ui.container.Box;
	import com.shrimp.framework.ui.controls.Button;
	import com.shrimp.framework.ui.controls.Image;
	import com.shrimp.papa.resource.ResourcePath;
	
	import flash.display.DisplayObjectContainer;
	
	public class WelcomeBox extends Box
	{
		public function WelcomeBox(parent:DisplayObjectContainer=null, xpos:Number=0, ypos:Number=0)
		{
			super(parent, xpos, ypos);
		}
		
		private var player:Image;
		
		private var play:Button;
		override protected function createChildren():void
		{
			super.createChildren();
			
			player = new Image(this);
			
			play = new Button(this);
			play.skinClass = ResourcePath.getWelcomeImage("start");
//			play.label = "      |";
			
			
//			var btn:Button = new Button(this);
//			btn.label = "aaaccaaa";
		}
	}
}