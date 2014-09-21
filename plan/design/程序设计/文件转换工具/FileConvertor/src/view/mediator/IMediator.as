package view.mediator
{
	import flash.display.DisplayObject;

	/**
	 * 
	 * @author Sol
	 * 
	 */	
	public interface IMediator
	{
		function registView(view:DisplayObject):void;
		function initListeners():void;
		function get controllerName():String;
	}
}