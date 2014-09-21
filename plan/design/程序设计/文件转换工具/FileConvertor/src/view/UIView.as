package view
{
	import com.shrimp.framework.ui.container.Container;
	import com.shrimp.framework.ui.container.VBox;
	import com.shrimp.framework.ui.controls.Button;
	import com.shrimp.framework.ui.controls.Label;
	import com.shrimp.framework.ui.controls.TabBar;
	import com.shrimp.framework.ui.controls.ViewStack;
	import com.shrimp.framework.utils.ArrayList;
	
	import control.FilesControll;
	
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.events.Event;
	
	import view.mediator.MediatorManager;
	
	/**
	 * 
	 * @author Sol
	 * 
	 */	
	public class UIView extends Container implements IRegMediator
	{
		public function UIView(parent:DisplayObjectContainer=null, xpos:Number=0, ypos:Number=0)
		{
			super(parent, xpos, ypos);
		}
		
		public var lblPath:Label;
		
		public var tbContent:TabBar;
		
		public var vsContent:ViewStack;
		
		private var vb:VBox;
		
		public var btnImportPPFile:Button;
		public var btnImportPngFile:Button;
		public var btnImportFolder:Button;
		
		public var btnExportSingle:Button;
		public var btnExportList:Button;
		override protected function createChildren():void
		{
			super.createChildren();
			
			//路径
			lblPath = new Label(this,10,50);
			lblPath.text = "路径:";
			//页签
			tbContent = new TabBar(this,10,100);
			tbContent.data = new ArrayList(["文件列表","数据预览"]);
			tbContent.selectedIndex=0;
			tbContent.addEventListener("select",onTabSelected);
			
			//内容
			vsContent = new ViewStack(this,34,140);
			var vect:Vector.<DisplayObject> = new Vector.<DisplayObject>;
			vect.push(new VSFileList());
			vect.push(new VSDataViewer());
			vsContent.children = vect;
			vsContent.selectedIndex = 1;
			
			vb = new VBox(this,700,105);
			
			btnImportPngFile = new Button(vb);
			btnImportPngFile.label = "导入png文件";
			btnImportPngFile.enabled=false;
			
			btnImportFolder = new Button(vb);
			btnImportFolder.label = "导入文件夹";
			
			btnImportPPFile = new Button(vb);
			btnImportPPFile.label = "导入PP文件";
			
			btnExportSingle = new Button(vb);
			btnExportSingle.label = "导出单个文件";
			btnExportSingle.enabled=false;
			
			btnExportList = new Button(vb);
			btnExportList.label = "导出列表";
			
			registMediator("UIViewMediator");
			registController();
		}
		
		protected function onTabSelected(event:Event):void
		{
			vsContent.selectedIndex = (event.target as TabBar).selectedIndex;
		}
		
		public function registMediator(mediatorName:String):void
		{
			MediatorManager.getInstance().getMediator(mediatorName).registView(this);
		}
		
		public function registController():void
		{
			new FilesControll();
		}
	}
}