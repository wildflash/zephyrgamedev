package com.zephyr.game
{
	import com.zephyr.events.GameEvent;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;

	public class Game extends EventDispatcher
	{
		
		public static const PLAY:int = 0;
		public static const PAUSED:int = 1;
		[Bindable]
		public var playState:int = 0;
		
		public var stepNo:int;
		
		public function Game():void {
			
		}
		
		public function dispatchStep(e:Event):void {
			this.stepNo++;
			if(this.stepNo>100) this.stepNo = 0;
			this.dispatchEvent(new GameEvent(GameEvent.STEP,this.stepNo));
		}
		
	}
}