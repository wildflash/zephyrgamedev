package com.zephyr.game.lang {
	
	import com.zephyr.utils.lang.LanguageData;

	public class StrongholdLanguageData extends LanguageData {
		
		private var strongholdLanguagesXML:XML =
			<Languages>
				<data id='0'>
					<Indonesian>Mainkan</Indonesian>
					<English>Play</English>
				</data>
				<data id='1'>
					<Indonesian>Melanjutkan</Indonesian>
					<English>Continue</English>
				</data>
				<data id='2'>
					<Indonesian>Penghargaan</Indonesian>
					<English>Achievements</English>
				</data>
				<data id='3'>
					<Indonesian>Pengaturan</Indonesian>
					<English>Setting</English>
				</data>
				<data id='4'>
					<Indonesian>Kredit</Indonesian>
					<English>Credits</English>
				</data>
			</Languages>;
			
		private var strongholdDefaultLanguage:String = "English";
		
		public function StrongholdLanguageData():void {
			this.languagesXml = strongholdLanguagesXML;
			this.defaultLanguage = strongholdDefaultLanguage;
			super();
		}
		
	}
}