package com.zephyr.interfaces {
	
	import com.zephyr.events.GameEvent;
	import com.zephyr.game.Game;
	
	public interface IGameObject {
		
		function step(event:GameEvent):void;
		function destroy():void;
		
	}
}