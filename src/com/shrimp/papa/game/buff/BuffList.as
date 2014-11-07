package com.shrimp.papa.game.buff
{
	import flash.utils.Dictionary;

	/**
	 *	buff列表, 数据层的 
	 * @author Sol
	 * 
	 */	
	public class BuffList
	{
		/**	buff列表*/
		private var _list:Dictionary;
		
		public function BuffList()
		{
			_list = new Dictionary();
		}
		
		/**
		 *	添加buff,如果已存在该buff,则对已有buff进行更新 
		 * @param buff
		 * 
		 */		
		public function addBuff(buff:IBuff):void
		{
			if(_list[buff.type]!=null)
			{
				var buff:IBuff = _list[buff.type];
				_list[buff.type] = buff.overlay(buff);
				return;
			}
			
			_list[buff.type] = buff;
		}
		
		/**
		 *	更新buff 具体内容 
		 * @param buff
		 * 
		 */		
		public function updateBuff(buff:IBuff):void
		{
			
		}
		
		/**
		 *	删除buff 
		 * @param buff
		 * 
		 */		
		public function deleteBuff(buff:IBuff):void
		{
			
		}
		
		/**
		 *	根据buffId进行删除 
		 * @param buffId
		 * 
		 */		
		public function deleteBuffById(buffId:int):void
		{
			
		}
		
		/**
		 *	buff列表更新 
		 * @param t
		 * 
		 */		
		public function update(t:Number):void
		{
//			var i:int;
			for(var i:* in _list)
			{
				trace(_list[i]);
			}
		}
		
		/**	清理所有buff*/
		public function clear():void
		{
			
		}
		
		/**
		 *	得到buff列表 
		 * @return 
		 * 
		 */		
		public function get list():Dictionary
		{
			return _list;
		}
	}
}