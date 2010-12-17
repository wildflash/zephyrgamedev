package com.zephyr.game.objects.gun
{
	import com.zephyr.game.Game;
	import com.zephyr.game.abstracts.AbstractStrongholdGun;
	import com.zephyr.game.interfaces.guntype.IPiercing;

	public class MachineGun extends AbstractStrongholdGun
	{
		
		//asset
        [Embed(source="../../../../../../assets/stronghold.swf", symbol="MachineGun")]
        private var AssetClass:Class;
		
		public function MachineGun(game:Game):void {
			this.addChild(new AssetClass());
			
			this.level = 1;
			this.exp = 0;
			this.kills = 0;
			this.state = GunState.IDLE;
			this.gunTypes = [IPiercing];
			this.baseHp = 100;
			this.baseMaxRange = 250;
			this.baseMaxAngle = 45;
			this.baseDamage = 5;
			this.baseAccuracy = 0.75;
			this.baseFireRate = 2500; //fire per 2500 miliseconds
			this.baseRotationSpeed = 1.5; //degree per 100 miliseconds
			
			this.hp = this.baseHp;
			this.minRange = this.baseMinRange;
			this.maxRange = this.baseMaxRange;
			this.maxAngle = this.baseMaxAngle;
			this.damage = this.baseDamage;
			this.accuracy = this.baseAccuracy;
			this.fireRate = this.baseFireRate;
			this.rotationSpeed = this.baseRotationSpeed;
			
			super(game);
		}
		
		override public function fire():void {
			
		}
		
		override public function reload():void {
			
		}
		
	}
}