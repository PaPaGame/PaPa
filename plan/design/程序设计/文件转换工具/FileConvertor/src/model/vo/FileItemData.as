package model.vo
{
	import flash.filesystem.File;

	/**
	 *	文件列表结构 
	 * @author Sol
	 * 
	 */	
	public class FileItemData
	{
		/**	id*/
		public var id:int;
		/**	文件名字*/
		public var name:String;
		/**	文件状态 1成功,0失败*/
		public var status:int;
		/**	文件*/
		public var file:File;
	}
}