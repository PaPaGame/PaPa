package view.mediator
{
	import flash.utils.Dictionary;

	/**
	 * 
	 * @author Sol
	 * 
	 */	
	public class MediatorManager
	{
		private static var _instance:MediatorManager;
		
		public static function getInstance():MediatorManager
		{
			if(!_instance)
			{
				_instance = new MediatorManager();
			}
			
			return _instance;
		}
		
		public function MediatorManager()
		{
			if(_instance)
			{
				throw new Error("controller Manager is singleton");
			}
			
			_instance = this;
			initNecessary();
		}
		
		private function initNecessary():void
		{
			mediatorMap=new Dictionary();
		}
		
		private static var mediatorMap:Dictionary;
		
		public function registMediator(controller:IMediator):void
		{
			if(mediatorMap[controller.controllerName]!=null)
			{
				throw new Error("controller already exist. controller name:"+controller.controllerName);
				return;
			}
			
			mediatorMap[controller.controllerName] = controller;
		}
		
		public function getMediator(name:String):IMediator
		{
			if(mediatorMap[name]==null)
			{
				throw new Error("controller not exist!!! name:"+name);
			}
			
			return mediatorMap[name];
		}
	}
}