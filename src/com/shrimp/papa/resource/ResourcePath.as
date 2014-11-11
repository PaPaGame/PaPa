package com.shrimp.papa.resource
{
	public class ResourcePath
	{
		public function ResourcePath()
		{
		}
		
		private static const Basepath:String="assets/";
		
		public static function getWelcomeImage(id:String):String
		{
			return Basepath+"welcome/"+id+".png";	
		}
	}
}