package com.zephyr.game.abstracts
{
	import com.actionsnippet.qbox.QuickBox2D;
	import com.actionsnippet.qbox.QuickObject;
	import com.zephyr.events.GameEvent;
	import com.zephyr.game.Game;
	import com.zephyr.game.interfaces.IGun;
	import com.zephyr.game.interfaces.IGunPlatform;
	import com.zephyr.game.interfaces.IPhysicsObject;
	import com.zephyr.interfaces.IGameObject;
	
	import flash.display.Sprite;
	import flash.events.MouseEvent;

	public class AbstractStrongholdGunPlatform extends Sprite implements IGunPlatform, IGameObject//, IPhysicsObject
	{
		
		private var game:Game;
		
		public function AbstractStrongholdGunPlatform():void {
			this.buttonMode = true;
			this.addEventListener(MouseEvent.CLICK, onClick);
			super();
		}
		
		private var _compatibleGuns:Array;
		public function set compatibleGuns(value:Array):void {
			_compatibleGuns = value;
		}
		public function get compatibleGuns():Array {
			return _compatibleGuns;
		}
		
		private var _installedGun:IGun;
		public function set installedGun(value:IGun):void {
			_installedGun = value;
		}
		public function get installedGun():IGun {
			return _installedGun;
		}
		
		public function step(event:GameEvent):void
		{
		}
		
		public function destroy():void
		{
		}
		
		/*private var _phy:QuickBox2D;
		public function set phy(value:QuickBox2D):void {
			_phy = value;
		}
		public function get phy():QuickBox2D {
			return _phy;
		}
		
		private var _po:QuickObject;
		public function set po(value:QuickObject):void {
			_po = value;
		}
		
		public function get po():QuickObject {
			return _po;
		}
		
		public function applyPhysics(phy:QuickBox2D):void
		{
		}
		
		public function destroyPhysics():void
		{
		}*/
		
		public function onClick(event:MouseEvent):void {
				
		}
		
	}
}