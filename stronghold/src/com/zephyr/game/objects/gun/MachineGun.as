package com.zephyr.game.objects.gun
{
	import com.zephyr.events.GameEvent;
	import com.zephyr.events.GameTimerEvent;
	import com.zephyr.game.Game;
	import com.zephyr.game.GameTimer;
	import com.zephyr.game.abstracts.AbstractStrongholdGun;
	import com.zephyr.game.interfaces.guntype.IPiercing;

	public class MachineGun extends AbstractStrongholdGun
	{
		
		//asset
        [Embed(source="../../../../../../assets/stronghold.swf", symbol="MachineGun")]
        private var AssetClass:Class;
		
		public function MachineGun(game:Game):void {
			super(game);
			
			this.addChild(new AssetClass());
			//this.opaqueBackground = true;
			
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
		}
		
		private var gunTimer:GameTimer;
		override public function set state(value:uint):void {
			_state = value;
			if(state==GunState.IDLE) {
				gunTimer = new GameTimer(game,100);
				gunTimer.addEventListener(GameTimerEvent.TIMER, idle);
				gunTimer.start();
			}
		}
		
		private var mult:int = 1
		private function idle(event:GameTimerEvent):void {
			this.rotation+= mult;
			if(this.rotation > this.maxAngle/2) mult = -1;
			if(this.rotation < -this.maxAngle/2) mult = 1;
		}
		
		override public function step(event:GameEvent):void {
			var stepNo:int = int(event.params);
			if(this.state==GunState.IDLE) {
				
			}
		}
		
		override public function fire():void {
			
		}
		
		override public function reload():void {
			
		}
		
	}
}