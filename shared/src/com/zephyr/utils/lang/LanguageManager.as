package com.zephyr.utils.lang {
	
	import flash.events.EventDispatcher;

	public class LanguageManager extends EventDispatcher {
		
		private static var instance:LanguageManager = new LanguageManager();
		
		private var langController:LanguageController;
		private var langData:LanguageData;
		
		[Bindable]
		public var langObj:Object; //languages object
		private var defaultLanguage:String;
		[Bindable]
		public var selectedLanguage:String;
		
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
			this.langObj = LanguageXMLtoObject.convert(this.langData.languagesXml);
			this.defaultLanguage = this.langData.defaultLanguage;
			this.selectedLanguage = this.defaultLanguage;
			
			langController = new LanguageController();
			langController.init(this.langObj.availableLanguages);
		}
		
		[Bindable]
		public function getLangStr(id:int):String {
			if(this.langObj.data[id]) {
				return this.langObj.data[id][this.selectedLanguage];
			} else {
				throw new Error("Data with provided id not defined!");
				return null;
			}
		}
		
	}
}