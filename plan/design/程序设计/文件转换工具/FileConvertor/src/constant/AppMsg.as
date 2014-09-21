package constant
{
	/**
	 *	内部消息传递编码 
	 * @author Sol
	 * 
	 */	
	public class AppMsg
	{
		private static const BASE:String="FILECONVERTOR_BASE_";
		
		/**	导入文件夹*/
		public static const IMPORT_FOLDER:String = BASE + "IMPORT_FOLDER";
		/**	导入文件*/
		public static const IMPORT_FILE:String=BASE+"IMPORT_FILE";
		/**导入PP文件*/
		public static const IMPORT_PP_FILE:String=BASE+"IMPORT_PP_FILE";
		/**	导出单个*/
		public static const EXPORT_SINGLE:String = BASE +"EXPORT_SINGLE";
		/**	批量导出*/
		public static const EXPORT_LIST:String=BASE+"EXPORT_LIST";
		/**	更新文件列表*/
		public static const UPDATE_FILE_LIST:String = BASE +"UPDATE_FILE_LIST";
		/**	更新单个文件*/
		public static const UPDATE_FILE:String=BASE+"UPDATE_FILE";
		
		public static const UPDATE_DATA_VIEW:String = BASE +"UPDATE_DATA_VIEW";
	}
}