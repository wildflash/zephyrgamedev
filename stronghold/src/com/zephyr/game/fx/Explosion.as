/*

explosion fx class
main code & asset extracted from: http://www.freeactionscript.com (by Philip Radvan)

*/

package com.zephyr.game.fx {
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	public class Explosion extends Sprite {
		
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
		private var explosionFragmentsOn:Boolean = true;
		
		//array of movieClips
		private var tempFragments:Array = []; //particle fragments mc
		private var tempExplosion:Array = []; //explosion mc
		
		private var targetDisplay:Object;
		private var xPos:Number;
		private var yPos:Number;
		private var shockwave:Shockwave;
		
		public function Explosion(targetDisplay:Object, xPos:Number, yPos:Number, preset:int=0, explosionFragmentsOn:Boolean=true):void {
			this.targetDisplay = targetDisplay;
			this.xPos = xPos;
			this.yPos = yPos;
			targetDisplay.addChild(this);
			setPreset(preset);
			this.explosionFragmentsOn = explosionFragmentsOn;
			//playShockwave();
			
			//run a for loop based on the amount of explosion particles
			for(var i:int=0; i < explosionParticleAmount; i++) {
				var randomNum:Number
				
				////create explosion bulb
				tempExplosion[i] = new ExplosionMc() as MovieClip;
				this.addChild(tempExplosion[i]);
				if(i==explosionParticleAmount-1) {
					tempExplosion[i].addFrameScript(tempExplosion[i].totalFrames-1, destroy);
				}
				//set position
				tempExplosion[i].x = xPos + Math.random()*explosionDistance - (explosionDistance/2);
				tempExplosion[i].y = yPos + Math.random()*explosionDistance - (explosionDistance/2);
				//get random scale
				randomNum = Math.random()*explosionSize + (explosionSize/2);
				//set scale
				tempExplosion[i].scaleX = randomNum;
				tempExplosion[i].scaleY = tempExplosion[i].scaleX;
				//set rotation
				randomNum = Math.random()*359;
				tempExplosion[i].rotation = randomNum;
				//set alpha
				tempExplosion[i].alpha = Math.random()*explosionAlpha + explosionAlpha/4;
				
				if(explosionFragmentsOn) {
					////create explosion fragments
					tempFragments[i] = new ParticleMc() as MovieClip;
					this.addChild(tempFragments[i]);
					//set position
					tempFragments[i].x = xPos + Math.random()*explosionDistance - (explosionDistance/2);
					tempFragments[i].y = yPos + Math.random()*explosionDistance - (explosionDistance/2);
					//get random scale
					randomNum = Math.random()*explosionSize + (explosionSize/2);
					//set scale
					tempFragments[i].scaleX = randomNum;
					tempFragments[i].scaleY = tempFragments[i].scaleX;
					//set rotation
					randomNum = Math.random()*359;
					tempFragments[i].rotation = randomNum;
					//set particle alpha
					tempFragments[i].alpha = Math.random()*explosionAlpha + explosionAlpha/4;
				}
			}
		}
		
		private function playShockwave():void {
			var shockwave:Shockwave = new Shockwave(this.targetDisplay,this.xPos,this.yPos,5);
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
				//delete explosion bulb
				tempExplosion[i].stop()
				this.removeChild(tempExplosion[i]);
				tempExplosion[i] = null;
				
				if(this.explosionFragmentsOn) {
					//delete explosion fragments
					tempFragments[i].stop();
					this.removeChild(tempFragments[i]);
					tempFragments[i] = null;
				}
			}
			parent.removeChild(this);
		}

	}
}