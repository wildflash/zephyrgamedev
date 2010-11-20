package com.zephyr.game.fx {
	import flash.display.Shader;
	import flash.filters.ShaderFilter;
	import flash.utils.ByteArray;
	
	public class Shockwave {
		
		[Embed("../../../../../assets/pixelbender/shockwave.pbj", mimeType="application/octet-stream")]
		private var ShockwaveFilter:Class;
		
		private var shockwaveShader:Shader;
		
		public function Shockwave(targetDisplay:Object, xPos:Number, yPos:Number, radius:Number):void {
			shockwaveShader = new Shader(new ShockwaveFilter() as ByteArray);
			shockwaveShader.data.position.value = [xPos,yPos];
			targetDisplay.filters = [new ShaderFilter(shockwaveShader)];
		}

	}
}