package com.zephyr.utils.lang {
	/*
	this will be unique for each game/app
	so this will be inherited
	*/
	public class LanguageData {
		
		public const USE_INTERNAL_XML:Boolean = false;
		public const USE_EXTERNAL_XML:Boolean = true;
		
		public var availableLanguages:Array; //array of available language
		public var languagesXml:XML;
		public var defaultLanguage:String;
		private var sourceData:Boolean;
		
		public function LanguageData(src:Boolean=USE_INTERNAL_XML, url:String=null):void {
			this.sourceData = src;
			if(src==USE_EXTERNAL_XML) {
				parseXML(url)
			}
		}
		
		private function parseXML(url:String):void {
			//parse language data from external xml
			//take and load xml from url
		}

	}
}