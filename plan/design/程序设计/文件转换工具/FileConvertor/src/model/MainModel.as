package model
{
	/**
	 *	数据存储 
	 * @author Sol
	 * 
	 */	
	public class MainModel
	{
		private static var _instance:MainModel;
		
		public static function getInstance():MainModel
		{
			if(!_instance)
			{
				_instance = new MainModel();
			}
			
			return _instance;
			
		}
		
		public function MainModel()
		{
			if(_instance)
			{
				throw new Error("Main Model is singleton");
			}
			
			_instance = this;
		}
		
		/**	文件列表*/
		public var fileList:Array;
		
		/**	图片根目录*/
		public var rootPath:String
		/**	图片保存目录*/
		public var outPath:String;
	}
}