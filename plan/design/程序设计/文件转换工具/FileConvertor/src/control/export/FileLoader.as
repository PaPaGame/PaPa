package control.export
{
	import com.shrimp.framework.load.LoaderManager;
	import com.shrimp.framework.load.ResourceLoader;
	import com.shrimp.framework.load.ResourceType;
	import com.shrimp.framework.utils.StringUtil;
	
	import flash.display.BitmapData;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.filesystem.File;
	import flash.system.ApplicationDomain;
	
	import model.vo.FileLoaderData;
	
	/**
	 *	文件加载器 
	 * @author Sol
	 * 
	 */	
	[Event(name="complete", type="flash.events.Event")]
	public class FileLoader extends EventDispatcher
	{
		public function FileLoader()
		{
		}
		
		/**	文件路径
		 * c:\documents and settings\destop\
		 * 根据文件路径自动拼成
		 * c:\documents and settings\destop\image.png
		 * c:\documents and settings\destop\image.xml
		 * 如果不存在xml,则掠过,仅将png图片进行加载
		 * */
		public var path:String="";

		public var fileName:String;
		private var hasXMLFile:Boolean=false;
		
		public var data:FileLoaderData;
		public function load():void
		{
			if(StringUtil.isNullOrEmpty(path))
			{
				throw new Error("加载路径为空");
			}
			
			//定义加载列表
			var loadList:Array = [];
			//图像文件
			var file:File = new File(path+".png");
			loadList.push({id:"png",url:file.nativePath,type:ResourceType.BMD});
			var xmlFile:File = new File(path+".xml");
			//判断xml文件是否存在,如果存在的话,将其加入到下载列表中
			if(xmlFile.exists)
			{
				hasXMLFile = true;
				loadList.push({id:"xml",url:xmlFile.nativePath,type:ResourceType.TXT});
			}
			//定义一个data,等全部加载完成后, 返回这个data
			data = new FileLoaderData();
			data.fileName = fileName;
			LoaderManager.loadAssets(loadList,onItemComplete,null,onAllComplete);
		}
		
		private function onItemComplete(item:Object, content:Object, domain:ApplicationDomain):void
		{
			switch(item.id)
			{
				case "png":
					data.bitmapdata = content as BitmapData;
					break;
				case "xml":
					data.xml = XML(content);
					break;
			}
		}
		
		private function onAllComplete():void
		{
			if(hasEventListener(Event.COMPLETE))
			{
				dispatchEvent(new Event(Event.COMPLETE));
			}
		}
	}
}