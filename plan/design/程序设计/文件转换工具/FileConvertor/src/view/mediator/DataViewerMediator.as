package view.mediator
{
	import flash.display.DisplayObject;
	import flash.errors.IllegalOperationError;
	
	import model.vo.FileLoaderData;
	
	import view.VSDataViewer;
	
	/**
	 * 
	 * @author Sol
	 * 
	 */	
	public class DataViewerMediator implements IMediator
	{
		public function DataViewerMediator()
		{
			name = "DataViewerMediator";
		}
		
		private var name:String;
		private var uiview:VSDataViewer;
		public function registView(view:DisplayObject):void
		{
			uiview = view as VSDataViewer;
			if(!uiview)
			{
				throw new IllegalOperationError("view is not VSDataViewer");
			}
			
			initListeners();
		}
		
		
		public function initListeners():void
		{
			
		}
		
		public function get controllerName():String
		{
			return name;
		}
		
		public function updateView(info:FileLoaderData):void
		{
			uiview.img.source = info.bitmapdata;
			if(info.xml==null)
			{
				uiview.xmlArea.text = "无配置数据!!";
			}
			else
			{
				uiview.xmlArea.text = info.xml.toString();
			}
			uiview.invalidateDisplayList();
		}
	}
}