package com.zephyr.utils.lang {
	
	import flash.events.EventDispatcher;

	public class LanguageManager extends EventDispatcher {
		
		private static var instance:LanguageManager = new LanguageManager();
		
		private var langController:LanguageController;
		private var langData:LanguageData;
		
		public function LanguageManager():void {
			if(instance) {
				throw new Error("It is a Singleton and can only be accessed through Singleton.getInstance()");
			}
		}
		
		public static function getInstance():LanguageManager {
			return instance;
		}
		
		public function init(langData:LanguageData):void {
			this.langData = langData;
			langController.init();
		}
		
	}
}