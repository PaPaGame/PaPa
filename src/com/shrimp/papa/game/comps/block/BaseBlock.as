package com.shrimp.papa.game.comps.block
{
	import com.shrimp.framework.ui.controls.core.Component;
	import com.shrimp.papa.game.comps.role.Player;
	
	import flash.display.DisplayObject;
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
		
		/**
		 * <code>
		 * 	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;up<br/>	
		 * ------------------<br/>
		 * |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|<br/>
		 * ------------------<br/>
		 * 	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;bottom<br/>
		 * </code>
		 * @param p	玩家
		 * @return 玩家
		 * 
		 */		
		protected function hitTestUp(p:Player):Player
		{
			//logic
			return p;
		}
		/**
		 * @see hitTestUp
		 */
		protected function hitTestBottom(p:Player):Player
		{
			//logic
			return p;
		}
	}
}