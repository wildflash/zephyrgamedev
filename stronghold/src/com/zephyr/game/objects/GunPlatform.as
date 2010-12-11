package com.zephyr.game.objects
{
	import com.actionsnippet.qbox.QuickBox2D;
	import com.actionsnippet.qbox.QuickObject;
	import com.zephyr.events.GameEvent;
	import com.zephyr.game.interfaces.IPhysicsObject;
	import com.zephyr.interfaces.IGameObject;
	
	import flash.display.Sprite;
	import flash.events.MouseEvent;

	public class GunPlatform extends Sprite implements IGameObject, IPhysicsObject
	{
		
		//asset
        [Embed(source="../../../../../assets/stronghold.swf", symbol="GunPlatform")]
        private var AssetClass:Class;
        
        private var phy:QuickBox2D;
        private var po:QuickObject;
		
		public function GunPlatform():void {
			this.addChild(new AssetClass());
			this.buttonMode = true;
			this.addEventListener(MouseEvent.CLICK, onClick);
		}
		
		private function onClick(event:MouseEvent):void {
				
		}
		
		public function step(event:GameEvent):void {
			
		}
		
		public function destroy():void {
			
		}
		
		public function applyPhysics(phy:QuickBox2D):void {
			this.phy = phy;
			var rotation:Number = this.rotation;
			this.rotation = 0;
			po = this.phy.addCircle({density:0, skin:this});
			po.angle = rotation/180*Math.PI;
		}
		
		public function destroyPhysics():void {
			
		}
		
		
	}
}