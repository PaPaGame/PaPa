package view.mediator
{
	import appkit.responders.NResponder;
	
	import constant.AppMsg;
	
	import flash.display.DisplayObject;
	import flash.errors.IllegalOperationError;
	import flash.events.MouseEvent;
	
	import model.MainModel;
	
	import view.UIView;
	
	/**
	 * 
	 * @author Sol
	 * 
	 */	
	public class UIViewMediator implements IMediator
	{
		public function UIViewMediator()
		{
			name = "UIViewMediator";
		}
		
		private var name:String;
		private var uiview:UIView;
		public function registView(view:DisplayObject):void
		{
			uiview = view as UIView;
			if(uiview==null)
			{
				throw new IllegalOperationError("param is not UIView");
			}
			initListeners();
		}
		
		
		public function initListeners():void
		{
			uiview.btnImportFolder.addEventListener(MouseEvent.CLICK,onButtonClick);
			uiview.btnImportPngFile.addEventListener(MouseEvent.CLICK,onButtonClick);
			uiview.btnImportPPFile.addEventListener(MouseEvent.CLICK,onButtonClick);
			uiview.btnExportSingle.addEventListener(MouseEvent.CLICK,onButtonClick);
			uiview.btnExportList.addEventListener(MouseEvent.CLICK,onButtonClick);
			
			NResponder.add(AppMsg.UPDATE_FILE_LIST,onUpdatePath);
		}
		
		private function onUpdatePath(arg:String):void
		{
			uiview.lblPath.text="路径:"+arg;
		}
		
		protected function onButtonClick(event:MouseEvent):void
		{
			switch(event.target)
			{
				case uiview.btnImportFolder:
					NResponder.dispatch(AppMsg.IMPORT_FOLDER);
					break;
				case uiview.btnImportPngFile:
					NResponder.dispatch(AppMsg.IMPORT_FILE);
					break;
				case uiview.btnImportPPFile:
					NResponder.dispatch(AppMsg.IMPORT_PP_FILE);
					break;
				case uiview.btnExportSingle:
					NResponder.dispatch(AppMsg.EXPORT_SINGLE);
					break;
				case uiview.btnExportList:
					NResponder.dispatch(AppMsg.EXPORT_LIST);
					break;
			}
		}
		
		public function get controllerName():String
		{
			return name;
		}
	}
}