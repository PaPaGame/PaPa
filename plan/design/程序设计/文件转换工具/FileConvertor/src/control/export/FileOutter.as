package control.export
{
	import constant.AppConfig;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.net.FileReference;
	import flash.utils.ByteArray;
	
	import model.MainModel;
	import model.vo.FileLoaderData;
	
	import utils.PNGEncoder;

	/**
	 *	文件输出类 
	 * @author Sol
	 * 
	 */	
	[Event(name="complete", type="flash.events.Event")]
	public class FileOutter extends EventDispatcher
	{
		public function FileOutter()
		{
		}
		
		public function out(data:FileLoaderData):void
		{
			
			var fs:FileStream = new FileStream();
			
			var byteArray:ByteArray = new ByteArray();
			var bytes:ByteArray = PNGEncoder.encode(data.bitmapdata);
//			trace(bytes.length);
			byteArray.writeBytes(bytes);
			byteArray.writeInt(data.bitmapdata.width);
			byteArray.writeInt(data.bitmapdata.height);
			if(data.xml!=null)
			{
				byteArray.writeUTFBytes(data.xml);
				byteArray.writeInt(data.xml.toString().length);
			}
			else
			{
				byteArray.writeInt(0);
			}
			byteArray.compress();
			
			//构建保存路径
			var saveName:String = MainModel.getInstance().outPath+getPrefixName(data.fileName)+AppConfig.suffix;
			var file:File = new File(saveName);
			fs.open(file,FileMode.WRITE);
			fs.writeBytes(byteArray);
			fs.close();
			trace("文件保存完成!",getPrefixName(data.fileName));
			if(hasEventListener(Event.COMPLETE))
			{
				dispatchEvent(new Event(Event.COMPLETE));
			}
		}
		
		//1.png
		private function getPrefixName(fullName:String):String
		{
			return fullName.substring(0,fullName.lastIndexOf('.'));
		}
	}
}