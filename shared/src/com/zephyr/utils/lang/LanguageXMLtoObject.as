/*
author: wildflash@zephyr.2k10

use this format for language xml:
<Languages>
	<data id=0>
		<Indonesian>Mainkan</Indonesian>
		<English>Play</English>
	</data>
	<data id=1>
		<Indonesian>Melanjutkan</Indonesian>
		<English>Continue</English>
	</data>
</Languages>

and you will get language object format like this:
languageObject.data[id].lang[language] contains language string

so for example: data[0]["English"] <=> "Play";

additional data:
languageObject.availableLanguages contains array

*/


package com.zephyr.utils.lang {
	
	public class LanguageXMLtoObject {
		
		public static var sampleXml:XML = 
<Languages>
	<data id='0'>
		<Indonesian>Mainkan</Indonesian>
		<English>Play</English>
	</data>
	<data id='1'>
		<Indonesian>Melanjutkan</Indonesian>
		<English>Continue</English>
	</data>
</Languages>;//*/
		
		public function LanguageXMLtoObject(xmlSource:XML):void {
			
		}
		
		public static function convert(xmlSource:XML):Object {
			var langObj:Object = new Object();
			
			//available languages
			langObj.availableLanguages = new Array();
			var data:XMLList = xmlSource.data[0].children();
			for each(var lang:XML in data) {
				langObj.availableLanguages.push(lang.name().localName);
			}
			
			//language data
			langObj.data = new Array();
			data = xmlSource.data;
			for each(var dt:XML in data) {
				langObj.data[int(dt.attributes())] = new Array();
				for each(var type:XML in dt.children()) {
					langObj.data[int(dt.attributes())][type.name()] = String(type);
				}
			}
			
			return langObj;
		}

	}
}