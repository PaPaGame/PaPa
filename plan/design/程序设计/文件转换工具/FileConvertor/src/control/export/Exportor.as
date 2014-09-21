package control.export
{
	import appkit.responders.NResponder;
	
	import com.shrimp.framework.managers.StageManager;
	import com.shrimp.framework.ui.controls.Alert;
	import com.shrimp.framework.utils.StringUtil;
	
	import constant.AppMsg;
	
	import flash.events.Event;
	
	import model.vo.FileItemData;
	import model.vo.FileLoaderData;

	/**
	 *	导出助手 
	 * @author Sol
	 * 
	 */	
	public class Exportor
	{
		public function Exportor()
		{
		}
		
		private var _source:Array;

		/**	要导出的数据源*/
		public function get source():Array
		{
			return _source;
		}

		public function set source(value:Array):void
		{
			_source = value;
		}
		
		private var item:FileItemData;
		//文件加载器
		private var loader:FileLoader;
		//文件输出人
		private var outter:FileOutter;
		public function export():void
		{
			loader = new FileLoader();
			outter = new FileOutter();
			StageManager.stage.addEventListener(Event.ENTER_FRAME,onEnter);
			onEnter();
		}
		
		protected function onEnter(event:Event=null):void
		{
			StageManager.stage.removeEventListener(Event.ENTER_FRAME,onEnter);
			item= source.shift() as FileItemData;
			loader.path = getPrefix(item.file.nativePath);
			loader.fileName = item.file.name;
			loader.addEventListener(Event.COMPLETE,loaderComplete);
			loader.load();
		}
		
		//如片和xml都加载完成后,需要进行file输出
		private function loaderComplete(event:Event):void
		{
			loader.removeEventListener(Event.COMPLETE,loaderComplete);
			var data:FileLoaderData = loader.data;
			if(!data)
			{
				onEnter();
				return;
			}
			
			//file输出
			outter.addEventListener(Event.COMPLETE,onOutterComplete);
			outter.out(data);
		}
		
		protected function onOutterComplete(event:Event):void
		{
			outter.removeEventListener(Event.COMPLETE,onOutterComplete);
			NResponder.dispatch(AppMsg.UPDATE_FILE,[item,1]);
			if(source.length == 0)
			{
				trace("all complete");
				return;
			}
			onEnter();
		}
		
		//根据路径 找到前缀名称
		private function getPrefix(path:String):String
		{
			return path.substring(0,path.lastIndexOf("."));
		}
	}
}