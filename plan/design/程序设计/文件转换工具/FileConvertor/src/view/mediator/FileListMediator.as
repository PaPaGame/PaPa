package view.mediator
{
	import appkit.responders.NResponder;
	
	import com.shrimp.framework.ui.controls.VScrollBar;
	import com.shrimp.framework.utils.ArrayList;
	
	import constant.AppMsg;
	
	import flash.display.DisplayObject;
	import flash.errors.IllegalOperationError;
	
	import model.MainModel;
	import model.vo.FileItemData;
	
	import view.VSFileList;
	import view.itemRender.FileItemRender;

	/**
	 * 
	 * @author Sol
	 * 
	 */	
	public class FileListMediator implements IMediator
	{
		public function FileListMediator()
		{
			name = "FileListMediator";
		}
		
		private var name:String;
		
		private var uivew:VSFileList;
		public function registView(view:DisplayObject):void
		{
			uivew = view as VSFileList;
			if(!uivew)
			{
				throw new IllegalOperationError("view is not VSFileList");
			}
			initListeners();
		}
		
		public function initListeners():void
		{
			NResponder.add(AppMsg.UPDATE_FILE_LIST,updateList);
			NResponder.add(AppMsg.UPDATE_FILE,onUpdateFileState);
		}
		
		public function get controllerName():String
		{
			return name;
		}
		
		private function updateList(arg:String):void
		{
			uivew.list.dataProvider= new ArrayList(MainModel.getInstance().fileList);
			uivew.list.validateNow();
			uivew.validateDisplayList();
		}
		
		//更新左侧列表项状态,滚动条,进度条
		private function onUpdateFileState(file:FileItemData,state:int):void
		{
			(uivew.list.getChildAt(file.id) as FileItemRender).updateState(state);
			if(file.id>=13)
			{
				var vs:VScrollBar = uivew.scroll.vScrollBar;
				vs.value+=24;
			}
			uivew.progressBar.value = file.id/(MainModel.getInstance().fileList.length-1);
		}
	}
}