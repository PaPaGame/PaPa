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
		private var cloudMap:Array;
		private var scaffoldMap:Array;
		public function ParallaxLayer(parent:DisplayObjectContainer=null, xpos:Number=0, ypos:Number=0)
		{
			super(parent, xpos, ypos);
		}
		
		override protected function init():void
		{	
			cloudMap=[];
			scaffoldMap=[];
			super.init();
		}
			
		
		override protected function createChildren():void
		{
			super.createChildren();
			createClouds();
			createScaffolds();
		}
		
		//创建脚手架
		private function createScaffolds():void
		{
			
		}
		
		//创建云彩
		private function createClouds():void
		{
			
		}
		
		public function update(elapsed:Number):void
		{
			
		}
	}
}