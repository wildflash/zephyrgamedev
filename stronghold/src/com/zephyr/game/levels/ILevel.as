package com.zephyr.game.levels {
	
	public interface ILevel {
		
		function set initialData(value:Object):void;
		function get initialData():Object;
		function set arsenal(value:Array):void;
		function get arsenal():Array;
		
	}
}