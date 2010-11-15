/*

explosion fx class
main code & asset extracted from: http://www.freeactionscript.com (by Philip Radvan)

*/

package com.zephyr.game.fx {
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.geom.ColorTransform;
	
	import mx.automation.codec.ColorPropertyCodec;
	
	public class Explosion extends Sprite{
		
		public static const NONE:int = 0;
		public static const TINY_EXPLOSION:int = 1;
		public static const SMALL_EXPLOSION:int = 2;
		public static const MEDIUM_EXPLOSION:int = 3;
		public static const BIG_EXPLOSION:int = 4;
		private var preset:int;
		
		[Embed(source="../../../../../assets/stronghold.swf", symbol="explosion")]
        private var ExplosionMc:Class;
        
		[Embed(source="../../../../../assets/stronghold.swf", symbol="explosion2")]
        private var ParticleMc:Class;
        
        //default explosion parameters
        private var explosionParticleAmount:Number = 15;
		private var explosionDistance:Number = 30;
		private var explosionSize:Number = 1;
		private var explosionAlpha:Number = .75;
		
		//array of movieClips
		private var tempClip:Array = []; //explosion mc
		private var tempClip2:Array = []; //particle mc
		
		public function Explosion(xPos:Number, yPos:Number, preset:int=0):void {
			setPreset(preset);
			
			//run a for loop based on the amount of explosion particles
			for(var i:int=0; i < explosionParticleAmount; i++) {
				//create particle
				tempClip2[i] = new ExplosionMc() as MovieClip;
				tempClip[i] = new ParticleMc() as MovieClip;
				this.addChild(tempClip2[i]);
				this.addChild(tempClip[i]);
				if(i==explosionParticleAmount-1) {
					tempClip2[i].addFrameScript(tempClip2[i].totalFrames-1, destroy);
				}
				//set particle position
				tempClip[i].x = xPos + Math.random()*explosionDistance - (explosionDistance/2);
				tempClip[i].y = yPos + Math.random()*explosionDistance - (explosionDistance/2);		
				tempClip2[i].x = xPos + Math.random()*explosionDistance - (explosionDistance/2);
				tempClip2[i].y = yPos + Math.random()*explosionDistance - (explosionDistance/2);
				//get random particle scale
				var randomNum:Number = Math.random()*explosionSize + (explosionSize/2);
				//set particle scale
				tempClip[i].scaleX = randomNum;
				tempClip[i].scaleY = tempClip[i].scaleX;
				//get random particle scale
				randomNum = Math.random()*explosionSize + (explosionSize/2);
				//set randomNum scale
				tempClip2[i].scaleX = randomNum;
				tempClip2[i].scaleY = tempClip2[i].scaleX;
				//set particle rotation
				randomNum = Math.random()*359;
				tempClip[i].rotation = randomNum;
				randomNum = Math.random()*359;
				tempClip2[i].rotation = randomNum;
				//set particle alpha
				tempClip[i].alpha = Math.random()*explosionAlpha + explosionAlpha/4;
				tempClip2[i].alpha = Math.random()*explosionAlpha + explosionAlpha/4;
			}
		}
		
		private function setPreset(preset:int):void {
			this.preset = preset;
			if(preset==Explosion.TINY_EXPLOSION) {
				explosionParticleAmount = 5;
				explosionDistance = 5;
				explosionSize = .75;
				explosionAlpha = .75;
			} else if(preset==Explosion.SMALL_EXPLOSION) {
				explosionParticleAmount = 15;
				explosionDistance = 25;
				explosionSize = 1;
				explosionAlpha = .75;
			} else if(preset==Explosion.MEDIUM_EXPLOSION) {
				explosionParticleAmount = 25;
				explosionDistance = 40;
				explosionSize = 1.5;
				explosionAlpha = .75;
			} else if(preset==Explosion.BIG_EXPLOSION) {
				explosionParticleAmount = 25;
				explosionDistance = 75;
				explosionSize = 2;
				explosionAlpha = .75;
			}
		}
		
		private function destroy():void {
			for(var i:int=0;i<explosionParticleAmount;i++) {
				tempClip[i].stop();
				this.removeChild(tempClip[i]);
				tempClip[i] = null;
				
				tempClip2[i].stop()
				this.removeChild(tempClip2[i]);
				tempClip2[i] = null;
			}
		}

	}
}