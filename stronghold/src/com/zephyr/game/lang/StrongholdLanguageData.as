package com.zephyr.game.lang {
	
	import com.zephyr.utils.lang.LanguageData;

	public class StrongholdLanguageData extends LanguageData {
		
		private var strongholdLanguagesXML:XML =
			<Languages>
				<data id='0'>
					<Indonesian>Mulai Mainkan</Indonesian>
					<English>New Game</English>
				</data>
				<data id='1'>
					<Indonesian>Melanjutkan</Indonesian>
					<English>Continue</English>
				</data>
				<data id='2'>
					<Indonesian>Pencapaian</Indonesian>
					<English>Achievements</English>
				</data>
				<data id='3'>
					<Indonesian>Cara Memainkan</Indonesian>
					<English>How To Play</English>
				</data>
				<data id='4'>
					<Indonesian>Pengaturan</Indonesian>
					<English>Setting</English>
				</data>
				<data id='5'>
					<Indonesian>Penghargaan</Indonesian>
					<English>Credits</English>
				</data>
				<data id='6'>
					<Indonesian>Tekan sembarang tombol untuk melewati</Indonesian>
					<English>Press any key to skip</English>
				</data>
				<data id='7'>
					<Indonesian>Bahasa</Indonesian>
					<English>Language</English>
				</data>
				<data id='8'>
					<Indonesian>Lakukan Perubahan</Indonesian>
					<English>Accept Changes</English>
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