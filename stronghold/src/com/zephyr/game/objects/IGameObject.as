package com.zephyr.game.objects {
	
	import com.zephyr.game.GameEvent;
	
	public interface IGameObject {
		
		function step(event:GameEvent):void;
		function destroy():void;
		
	}
}