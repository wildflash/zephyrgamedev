package com.zephyr.game.assets
{
	import com.zephyr.assets.GameAssets;

	public class StrongholdGameAssets extends GameAssets
	{
		
		private static var instance:StrongholdGameAssets = new StrongholdGameAssets();
		
		public function StrongholdGameAssets():void
		{
			if(instance) {
				throw new Error("It is a Singleton and can only be accessed through Singleton.getInstance()");
			}
		}
		
		public static function getInstance():StrongholdGameAssets {
			return instance;
		}
		
		//assets sources
		[Embed(source="../../../../../assets/stronghold.swf", symbol="explosion")]
        public var ExplosionMcClass:Class;
        
		[Embed(source="../../../../../assets/stronghold.swf", symbol="explosion2")]
        public var ParticleMcClass:Class;
        
        [Embed("../../../../../assets/pixelbender/shockwave.pbj", mimeType="application/octet-stream")]
		public var ShockwaveShaderClass:Class;
		
	}
}