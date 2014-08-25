package com.shrimp.papa.game.view
{
	import com.shrimp.framework.managers.StageManager;
	import com.shrimp.framework.ui.container.Container;
	import com.shrimp.framework.ui.controls.Label;
	import com.shrimp.framework.ui.controls.core.Component;
	
	import flash.display.DisplayObjectContainer;
	import flash.utils.getTimer;

	/**
	 * 
	 * @author Sol
	 * 
	 */
	public class GameLoader extends Container
	{
		private var tf:Label;
		
		
		public function GameLoader(parent:DisplayObjectContainer=null, xpos:Number=0, ypos:Number=0)
		{
			super(parent, xpos, ypos);
			var w:Number = StageManager.getStageWidth();
			var h:Number = StageManager.getStageHeight();
			setActualSize(w,h);
		}
		
		override protected function createChildren():void
		{
			super.createChildren();
			tf=new Label(this);
			tf.horizontalCenter = 0;
			tf.verticalCenter = 0;
		}
		
		public function updateView():void
		{
			tf.text = getTimer()+'';
		}
	}
}