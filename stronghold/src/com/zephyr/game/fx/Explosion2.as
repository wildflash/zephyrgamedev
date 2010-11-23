package com.zephyr.game.fx
{
	import com.zephyr.game.Game;
	
	import flash.display.Sprite;
	
	//this class play shockwave fx followed by explosion fx
	public class Explosion2 extends GameFx
	{
		
		private var shockwave:Shockwave;
		private var maxRadius:Number;
		
		private var explosion:Explosion;
		
		private var xPos:Number;
		private var yPos:Number;
		private var preset:int;
		private var explosionFragmentsOn:Boolean = true;
		private var useStepFunction:Boolean;
		
		public function Explosion2(game:Game, targetDisplay:Sprite, xPos:Number, yPos:Number, preset:int=0, explosionFragmentsOn:Boolean=true, useStepFunction:Boolean=true):void {
			this.game = game;
			this.targetDisplay = targetDisplay;
			this.xPos = xPos;
			this.yPos = yPos;
			this.preset = preset;
			this.explosionFragmentsOn = explosionFragmentsOn;
			this.useStepFunction = useStepFunction;
			setMaxRadius(preset);
			super(game);
			
			//play shockwave
			this.shockwave = new Shockwave(game, game.gameScreen.gameArea, xPos, yPos, maxRadius);
			//FxManager.getInstance().addFx(this.shockwave);
			//FxManager.getInstance().addEventListener(FxEvent.REMOVE_FX_OBJECT, playExplosionFx);
			this.shockwave.addEventListener(FxEvent.PLAY_COMPLETED, playExplosionFx);
		}
		
		private function setMaxRadius(preset:int):void {
			if(preset==Explosion.TINY_EXPLOSION) {
				this.maxRadius = 3;
			} else if(preset==Explosion.SMALL_EXPLOSION) {
				this.maxRadius = 7;
			} else if(preset==Explosion.MEDIUM_EXPLOSION) {
				this.maxRadius = 15;
			} else if(preset==Explosion.BIG_EXPLOSION) {
				this.maxRadius = 30;
			} 
		}
		
		private function playExplosionFx(event:FxEvent):void {
			this.shockwave.removeEventListener(FxEvent.PLAY_COMPLETED, playExplosionFx);
			this.shockwave = null;
			this.explosion = new Explosion(this.game, this.targetDisplay, this.xPos, this.yPos, this.preset, this.explosionFragmentsOn, this.useStepFunction);
			//FxManager.getInstance().addFx(this.explosion);
			//FxManager.getInstance().addEventListener(FxEvent.REMOVE_FX_OBJECT, removeFx);
			this.explosion.addEventListener(FxEvent.PLAY_COMPLETED, removeFx);
		}
		
		private function removeFx(event:FxEvent):void {
			this.explosion.removeEventListener(FxEvent.REMOVE_FX_OBJECT, removeFx);
			this.explosion.parent.removeChild(this.explosion);
			this.explosion = null;
			this.removeFxObject();
		}
		
	}
}