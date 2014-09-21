package view
{
	import com.shrimp.framework.ui.container.Container;
	import com.shrimp.framework.ui.container.ScrollerContainer;
	import com.shrimp.framework.ui.controls.DataContainer;
	import com.shrimp.framework.ui.layout.VerticalLayout;
	import com.shrimp.framework.utils.ClassFactory;
	
	import components.ProgressBar;
	
	import control.FileListControll;
	
	import flash.display.DisplayObjectContainer;
	
	import view.itemRender.FileItemRender;
	import view.mediator.MediatorManager;
	
	/**
	 * 
	 * @author Sol
	 * 
	 */	
	public class VSFileList extends Container implements IRegMediator
	{
		public function VSFileList(parent:DisplayObjectContainer=null, xpos:Number=0, ypos:Number=0)
		{
			super(parent, xpos, ypos);
		}
		
		public var list:DataContainer;
		
		public var scroll:ScrollerContainer;
		
		public var progressBar:ProgressBar;
		override protected function createChildren():void
		{
			super.createChildren();
			scroll = new ScrollerContainer(this);
			
			list = new DataContainer(scroll);
			list.itemRender =  new ClassFactory(FileItemRender);
			list.layout = new VerticalLayout();

			progressBar = new ProgressBar(this,0,300);
			progressBar.width = 600;
				
			registMediator("FileListMediator");
			registController();
		}
		
		public function registMediator(mediatorName:String):void
		{
			MediatorManager.getInstance().getMediator(mediatorName).registView(this);
			
		}
		
		public function registController():void
		{
			new FileListControll();
		}
		
		override protected function updateDisplayList():void
		{
			super.updateDisplayList();
			scroll.setActualSize(600,280);
		}
	}
}