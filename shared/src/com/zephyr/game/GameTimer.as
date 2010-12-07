package com.zephyr.game
{
	import com.zephyr.events.GameEvent;
	import com.zephyr.events.GameTimerEvent;
	
	import flash.display.Sprite;
	
	
	public class GameTimer extends Sprite {
		
		private static const INFINITE:Boolean = false;
		private static const DEFINITE:Boolean = true;
		private var state:Boolean;
		
		private var game:Game;
		private var duration:Number; //in miliseconds
		private var repeat:Number;
		
		private var rc:Number = 0;
		private var dtc:Number = 0;
		private var dt:Number;
		
		public function GameTimer(game:Game, duration:Number, repeat:Number=-1):void {
			this.game = game;
			this.duration = duration;
			this.repeat = repeat;
			
			this.dt = 1000/GameSettings.getInstance().frameRate;
			if(this.repeat==-1) {
				this.state = GameTimer.INFINITE;
			} else {
				this.state = GameTimer.DEFINITE;
			}
		}
		
		public function start():void {
			game.addEventListener(GameEvent.STEP, step);
		}
		
		public function stop():void {
			game.removeEventListener(GameEvent.STEP, step);
		}
		
		public function restart():void {
			stop();
			rc = 0;
			dtc = 0;
			start();
		}
		
		private function step(event:GameEvent):void {
			dtc += dt;
			if(dtc > duration) {
				dtc = 0;
				rc++;
				if(rc==repeat) {
					this.dispatchEvent(new GameTimerEvent(GameTimerEvent.TIMER_COMPLETE));
					stop();
					return;
				}
				this.dispatchEvent(new GameTimerEvent(GameTimerEvent.TIMER));
			}
		}

	}
}