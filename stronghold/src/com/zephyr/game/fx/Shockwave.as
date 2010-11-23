package com.zephyr.game.fx {
	import com.zephyr.game.Game;
	import com.zephyr.game.GameEvent;
	
	import flash.display.Shader;
	import flash.display.Sprite;
	import flash.filters.ShaderFilter;
	import flash.utils.ByteArray;
	
	public class Shockwave extends GameShaderFilterFx {
		
		[Embed("../../../../../assets/pixelbender/shockwave.pbj", mimeType="application/octet-stream")]
		private var ShaderAsset:Class;
		
		private var shockwaveShader:Shader;
		private var maxRadius:Number;
		private var counter:int;
		private var radius:int;
		
		public function Shockwave(game:Game, targetDisplay:Sprite, xPos:Number, yPos:Number, maxRadius:Number):void {
			counter = 0;
			this.targetDisplay = targetDisplay;
			this.maxRadius = maxRadius;
			super(game);
			
			shockwaveShader = new Shader(new ShaderAsset() as ByteArray);
			shockwaveShader.data.position.value = [xPos,yPos];
			//shockwaveShader.data.radius.value = [maxRadius];
			
			//shaderFilter = new ShaderFilter(shockwaveShader);
			
			//if(!targetDisplay.filters) targetDisplay.filters = [];
			//targetDisplay.filters = [shaderFilter];
			
			//targetDisplay.filters.push(shaderFilter);
			
			//var a:ArrayCollection =  new ArrayCollection(targetDisplay.filters);
			//a.addItem(new ShaderFilter(shockwaveShader));
			
			/*for(var i:int=0;i<3;i++) {
				targetDisplay.filters.push(new GlowFilter());
			}
			
			targetDisplay.filters = [new GlowFilter(),new GlowFilter(),new GlowFilter()];*/
			
			/*shockwaveShader.data.position.value = [200,200];
			var f:ArrayCollection = new ArrayCollection();
			for(var i:int=0;i<3;i++) {
				f.addItem(new ShaderFilter(shockwaveShader));
			}
			targetDisplay.filters = f.source;*/
		}
		
		override public function step(event:GameEvent):void {
			//if(int(event.params)%2==0) {
				counter++;
				radius = 2*counter;
				if(shaderFilter) {
					this.removeFilter(shaderFilter);
					shaderFilter = null;
				}
				if(radius > this.maxRadius) {
					destroy();
					return;
				}
				shockwaveShader.data.radius.value = [radius];
				//shockwaveShader.data.position.value = [200,200];
				shaderFilter = new ShaderFilter(shockwaveShader);
				this.applyFilter(shaderFilter);
			//}
		}
		
		override public function destroy():void {
			this.removeFxObject();
		}

	}
}