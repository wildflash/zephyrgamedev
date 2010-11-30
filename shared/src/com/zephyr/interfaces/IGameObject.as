package com.zephyr.interfaces {
	
	import com.zephyr.events.GameEvent;
	
	public interface IGameObject {
		
		function step(event:GameEvent):void;
		function destroy():void;
		
	}
}