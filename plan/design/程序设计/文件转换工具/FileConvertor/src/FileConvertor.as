package
{
	import com.shrimp.framework.core.ApplicationBase;
	import com.shrimp.framework.managers.StageManager;
	
	import flash.events.Event;
	
	import view.UIView;
	import view.mediator.DataViewerMediator;
	import view.mediator.FileListMediator;
	import view.mediator.MediatorManager;
	import view.mediator.UIViewMediator;
	
	/**
	 * @author Sol 
	 */	
	[SWF(width="800",height="480")]
	public class FileConvertor extends ApplicationBase
	{
		public function FileConvertor()
		{
			addEventListener(Event.ENTER_FRAME,onEnter);
		}
		
		private var uiView:UIView;
		protected function onEnter(event:Event):void
		{
			removeEventListener(Event.ENTER_FRAME,onEnter);
			StageManager.init(this);
			MediatorManager.getInstance().registMediator(new UIViewMediator());
			MediatorManager.getInstance().registMediator(new FileListMediator());
			MediatorManager.getInstance().registMediator(new DataViewerMediator());
			uiView = new UIView(this);
		}
	}
}