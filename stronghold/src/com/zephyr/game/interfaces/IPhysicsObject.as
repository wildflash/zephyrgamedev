package com.zephyr.game.interfaces
{
	import com.actionsnippet.qbox.QuickBox2D;
	
	public interface IPhysicsObject
	{
		
		function applyPhysics(phy:QuickBox2D):void;
		function destroyPhysics():void;
		
	}
}