package com.zephyr.game.interfaces
{
	import com.actionsnippet.qbox.QuickBox2D;
	import com.actionsnippet.qbox.QuickObject;
	
	public interface IPhysicsObject
	{
		
		function set phy(value:QuickBox2D):void;
		function get phy():QuickBox2D;
		function set po(value:QuickObject):void;
		function get po():QuickObject;
		
		function applyPhysics(phy:QuickBox2D):void;
		function destroyPhysics():void;
		
	}
}