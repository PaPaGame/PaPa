package utils
{
	import flash.filesystem.File;

	/**
	 *	遍历指定文件夹递归获取文件 
	 * @author Sol
	 * 
	 */	
	public class FileUtils
	{
		public function FileUtils()
		{
		}

		private static var sysFile:File; // = new File();
		public static var FilrUrlArr:Array=[];
		private static var key:int; //递归结束标志

		public static function getFileArr(_url:String="", loadComplete:Function=null,extension:String=""):void
		{
			key++;
			if (_url != "")
			{
				sysFile=new File(_url);
			}
			var arr:Array=sysFile.getDirectoryListing();
			var leg:int=arr.length;
			for (var i:int=0; i < leg; i++)
			{
				var file:File=arr[i] as File;
				if (file.isDirectory)
				{
					getFileArr(file.url);
				}
				else
				{
//					FilrUrlArr.push(decodeURI(file.nativePath));
					if(file.extension == extension && extension!="")
					{
						FilrUrlArr.push(file);
					}
					else if(extension=="")
					{
						FilrUrlArr.push(file);
					}
					
					
				}
			}
			key--;
			if (key == 0)
			{
				//判断递归是否结束
				Idone();
				if (loadComplete != null)
				{
					loadComplete(FilrUrlArr);
				}
			}
		}

		private static function Idone():void
		{
//			trace(FilrUrlArr.join("\n"));
		}
	}
}
