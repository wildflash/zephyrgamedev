package com.zephyr.game.preloader {
	import com.zephyr.utils.Preloader;
	
	public class HorizonPreloader extends Preloader {
		
		[Embed(source="../../../../../assets/horizon.swf", symbol="Preloader")]
        private var HorizonPreloaderSymbol:Class;
		
		public function HorizonPreloader():void {
			FlashPreloaderSymbol = HorizonPreloaderSymbol;
			super();
		}

	}
}