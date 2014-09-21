package view
{
	import com.shrimp.framework.ui.container.Container;
	import com.shrimp.framework.ui.container.HBox;
	import com.shrimp.framework.ui.controls.Image;
	import com.shrimp.framework.ui.controls.TextArea;
	
	import control.DataViewerControll;
	
	import flash.display.DisplayObjectContainer;
	
	import view.mediator.MediatorManager;
	
	/**
	 * 
	 * @author Sol
	 * 
	 */	
	public class VSDataViewer extends Container implements IRegMediator
	{
		public function VSDataViewer(parent:DisplayObjectContainer=null, xpos:Number=0, ypos:Number=0)
		{
			super(parent, xpos, ypos);
		}
		
		public var img:Image;
		
		public var xmlArea:TextArea;
		override protected function createChildren():void
		{
			super.createChildren();
			
			var con:HBox = new HBox(this);
			img = new Image(con);
			xmlArea = new TextArea(con);
			xmlArea.setActualSize(300,300);
			registMediator("DataViewerMediator");
			registController();
		}
		
		public function registMediator(mediatorName:String):void
		{
			MediatorManager.getInstance().getMediator(mediatorName).registView(this);
			
		}
		
		public function registController():void
		{
			new DataViewerControll();
		}
		
		override protected function updateDisplayList():void
		{
			super.updateDisplayList();
			img.validateNow();
			xmlArea.validateNow();
		}
	}
}