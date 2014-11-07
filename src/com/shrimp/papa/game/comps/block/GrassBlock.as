package com.shrimp.papa.game.comps.block
{
	import com.shrimp.papa.game.buff.BuffFactory;
	import com.shrimp.papa.game.buff.BuffType;
	import com.shrimp.papa.game.buff.IBuff;
	import com.shrimp.papa.game.comps.human.Human;
	
	import flash.display.DisplayObjectContainer;
	
	/**
	 *	草块 
	 * @author Sol
	 * 
	 */	
	public class GrassBlock extends BaseBlock
	{
		public function GrassBlock(parent:DisplayObjectContainer=null, xpos:Number=0, ypos:Number=0)
		{
			super(parent, xpos, ypos);
		}
		
		override protected function hitTestUp(p:Human):Human
		{
			super.hitTestUp(p);
			
			//如果碰撞到的话.
			//给人物一个buff
			if(true)
			{
				var b:IBuff = BuffFactory.genBuff(BuffType.BUFF_SUB_UP_SPEED);
				p.addBuff(b);
			}
			
			return p;
		}
	}
}