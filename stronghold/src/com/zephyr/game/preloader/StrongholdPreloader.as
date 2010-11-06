package com.zephyr.game.preloader {
	import com.zephyr.utils.Preloader;
	
	public class StrongholdPreloader extends Preloader {
		
		[Embed(source="../../../../../assets/stronghold.swf", symbol="Preloader")]
        private var HorizonPreloaderSymbol:Class;
		
		public function StrongholdPreloader():void {
			FlashPreloaderSymbol = HorizonPreloaderSymbol;
			super();
		}

	}
}