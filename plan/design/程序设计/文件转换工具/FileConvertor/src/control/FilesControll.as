package control
{
	import appkit.responders.NResponder;
	
	import constant.AppConfig;
	import constant.AppMsg;
	
	import control.export.Exportor;
	import control.importPP.Importor;
	
	import flash.events.Event;
	import flash.filesystem.File;
	import flash.net.FileFilter;
	
	import model.MainModel;
	import model.vo.FileItemData;
	
	import utils.FileUtils;

	public class FilesControll extends BaseController
	{
		public function FilesControll()
		{
			super();

			filebrowser = new File();
		}

		override public function collectionInterestingMsg():void
		{
			NResponder.add(AppMsg.IMPORT_FOLDER, importFolder);
			NResponder.add(AppMsg.IMPORT_FILE, importFile);
			NResponder.add(AppMsg.IMPORT_PP_FILE, importPPFile);
			NResponder.add(AppMsg.EXPORT_SINGLE, exportSingle);
			NResponder.add(AppMsg.EXPORT_LIST, exportList);
		}


		//导出列表
		private function exportList():void
		{
			trace("export list");
			var export:Exportor = new Exportor();
			export.source = MainModel.getInstance().fileList.concat()
			//执行导出逻辑
			export.export();
		}

		//导出单个文件
		private function exportSingle():void
		{
			trace("export single");
		}

		private var filebrowser:File;

		private function importFolder():void
		{
			trace("import folder");
			filebrowser.browseForDirectory("选择一个文件夹");
			filebrowser.addEventListener(Event.SELECT, onSelect);
		}

		protected function onSelect(event:Event):void
		{
			filebrowser.removeEventListener(Event.SELECT, onSelect);
			var f:File = new File(filebrowser.nativePath+"\\out\\");
			if(f.isDirectory)
			{
				f.deleteDirectory(true);
			}
			FileUtils.getFileArr(filebrowser.nativePath, onLoadComplete, "png");
		}

		private function importFile():void
		{
			trace("import file");
			var fileFilter:FileFilter = new FileFilter("png文件(*.png)", "*.png");
			filebrowser.browseForOpen("选择一个png文件", [fileFilter]);
		}

		private function importPPFile():void
		{
			trace("import ppfile");
			var fileFilter:FileFilter = new FileFilter("pp文件(*.pp)", "*.pp");
			filebrowser.browseForOpen("选择一个pp文件", [fileFilter]);
			filebrowser.addEventListener(Event.SELECT,onImportSelect);
		}
		
		protected function onImportSelect(event:Event):void
		{
			var importor:Importor = new Importor();
			importor.importPP(filebrowser.nativePath);
		}
		
		private function onLoadComplete(arr:Array):void
		{
			buildVos(arr);
			NResponder.dispatch(AppMsg.UPDATE_FILE_LIST, [filebrowser.nativePath]);
			//本地路径
			MainModel.getInstance().rootPath = filebrowser.nativePath;
			//输出路径
			MainModel.getInstance().outPath = MainModel.getInstance().rootPath + AppConfig.outFolder;
		}

		private function buildVos(files:Array):void
		{
			var arr:Array = files;
			var vo:FileItemData;
			var file:File;
			var result:Array = [];
			for (var i:int = 0; i < arr.length; i++)
			{
				file = arr[i] as File;
				vo = new FileItemData();
				vo.id = i;
				vo.name = file.name;
				vo.status = 0;
				vo.file = file;
				result.push(vo);
			}

			MainModel.getInstance().fileList = result;
		}
	}
}