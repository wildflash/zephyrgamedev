package com.zephyr.game.interfaces
{
	
	public interface IGunPlatform
	{
		
		function set compatibleGuns(value:Array):void;
		function get compatibleGuns():Array;
		function set installedGun(value:IGun):void;
		function get installedGun():IGun;
		
	}
}