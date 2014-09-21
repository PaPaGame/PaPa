package control.importPP
{
	import appkit.responders.NResponder;
	
	import com.shrimp.framework.load.LoaderManager;
	
	import constant.AppMsg;
	
	import control.export.FileLoader;
	
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.system.ApplicationDomain;
	import flash.utils.ByteArray;
	
	import model.vo.FileItemData;
	import model.vo.FileLoaderData;

	/**
	 *	导入类 
	 * @author Sol
	 * 
	 */	
	public class Importor
	{
		public function Importor()
		{
		}
		
		public function importPP(path:String):void
		{
			LoaderManager.loadBYTE(path,onComplete);
		}
		
		private function onComplete(item:Object, content:Object, domain:ApplicationDomain):void
		{
//			trace(content)
			//content 是一个byteArray;
			var byteArray:ByteArray = content as ByteArray;
			byteArray.uncompress();
			byteArray.position = byteArray.length - 4;
			var len:int = byteArray.readInt();
			if(len != 0)
			{
				byteArray.position = byteArray.length - 4 - len;
				xml = new XML(byteArray.readUTFBytes(len));
			}
			byteArray.position = byteArray.length - 4 - len - 4;
			var h:int = byteArray.readInt();
			byteArray.position = byteArray.length - 4 -len - 4 - 4;
			var w:int = byteArray.readInt();
			//取位图数据
			var datas:ByteArray=new ByteArray();
			byteArray.position=0;
			byteArray.readBytes(datas, 0, byteArray.length - 4 - len - 4 - 4);
			bmd = new BitmapData(w,h,true,0xFF0000);
			loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE,loaderComplete);
			loader.loadBytes(byteArray);
		}
		
		private var loader:Loader;
		private var bmd:BitmapData;
		private var xml:XML;
		private var fileInfo:FileLoaderData;
		private function loaderComplete(event:Event):void
		{
			fileInfo=new FileLoaderData();
			bmd.draw(loader);
			fileInfo.bitmapdata = bmd;
			fileInfo.xml = xml;
			NResponder.dispatch(AppMsg.UPDATE_DATA_VIEW,[fileInfo]);
			loader.removeEventListener(Event.COMPLETE,loaderComplete);
			loader.unloadAndStop(true);
			loader=null;
		}
	}
}