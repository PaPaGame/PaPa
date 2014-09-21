package control
{
	import appkit.responders.NResponder;
	
	import constant.AppMsg;
	
	import model.vo.FileLoaderData;
	
	import view.mediator.DataViewerMediator;
	import view.mediator.IMediator;
	import view.mediator.MediatorManager;

	/**
	 * 
	 * @author Sol
	 * 
	 */	
	public class DataViewerControll extends BaseController
	{
		public function DataViewerControll()
		{
			super();
		}
		
		override public function collectionInterestingMsg():void
		{
			super.collectionInterestingMsg();
			NResponder.add(AppMsg.UPDATE_DATA_VIEW,onUpdateView);
		}
		
		private function onUpdateView(info:FileLoaderData):void
		{
			//太困了. 先这么写吧.
			var im:IMediator = MediatorManager.getInstance().getMediator("DataViewerMediator");
			(im as DataViewerMediator).updateView(info);
		}
	}
}