package com.zephyr.utils.lang {
	/*
	this will be unique for each game/app
	so this will be inherited
	*/
	public class LanguageData {
		
		public const USE_INTERNAL_XML:int = 0;
		public const USE_EXTERNAL_XML:int = 1;
		
		public var availableLanguages:Array; //array of available language
		private var languagesXml:XML;
		
		public function LanguageData():void {
			
		}
		
		//parse language data from xml in as3
		private function parseData1():void {
			
		}
		
		//parse language data from external xml
		private function parseData2():void {
			
		}

	}
}