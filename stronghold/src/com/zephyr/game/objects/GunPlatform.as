package com.zephyr.game.objects
{
	import com.zephyr.game.abstracts.AbstractStrongholdGunPlatform;
	import com.zephyr.game.objects.gun.MachineGun;
	
	import flash.events.MouseEvent;

	public class GunPlatform extends AbstractStrongholdGunPlatform
	{
		
		//asset
        [Embed(source="../../../../../assets/stronghold.swf", symbol="GunPlatform")]
        private var AssetClass:Class;
        
		public function GunPlatform():void {
			this.addChild(new AssetClass());
			
			this.compatibleGuns = [MachineGun]
			
			super();
		}
		
		/*override public function onClick(event:MouseEvent):void {
			
		}
		
		override public function applyPhysics(phy:QuickBox2D):void {
			this.phy = phy;
			var rotation:Number = this.rotation;
			this.rotation = 0;
			po = this.phy.addCircle({density:0, skin:this});
			po.angle = rotation/180*Math.PI;
			
			var p:Point = new Point(this.x,this.y);
			p = this.globalToLocal(p);
			trace('position ('+p.x+','+p.y+')');
		}
		
		override public function destroyPhysics():void {
			
		}*/
		
	}
}