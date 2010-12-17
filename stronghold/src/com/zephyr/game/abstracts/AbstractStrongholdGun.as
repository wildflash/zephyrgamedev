package com.zephyr.game.abstracts
{
	import com.zephyr.events.GameEvent;
	import com.zephyr.game.Game;
	import com.zephyr.game.interfaces.IGun;
	import com.zephyr.game.interfaces.guntype.IGunType;
	import com.zephyr.interfaces.IGameObject;
	
	import flash.display.Sprite;

	public class AbstractStrongholdGun extends Sprite implements IGun, IGameObject
	{
		
		private var game:Game;
		
		public function AbstractStrongholdGun(game:Game):void {
			this.game = game;
			this.game.addEventListener(GameEvent.STEP,step);
			super();
		}
		
		private var _level:uint
		public function set level(value:uint):void {
			_level = value
		}
		public function get level():uint {
			return _level;
		}
		
		private var _exp:Number;
		public function set exp(value:Number):void {
			_exp = value;
		}
		public function get exp():Number {
			return _exp;
		}
		
		private var _kills:uint;
		public function set kills(value:uint):void {
			_kills = value;
		}
		public function get kills():uint {
			return _kills;
		}
		
		private var _state:uint;
		public function set state(value:uint):void {
			_state = value;
		}
		public function get state():uint {
			return _state;
		}
		
		private var _gunTypes:Array;
		public function set gunTypes(value:Array):void {
			_gunTypes = value
		}
		public function get gunTypes():Array {
			return _gunTypes;
		}
		
		public function isHasType(type:IGunType):Boolean {
			for(var i:uint=0;i<this._gunTypes.length;i++) {
				if(type==_gunTypes[i]) {
					return true;
				}
			}
			return false;
		}
		
		private var _baseHp:uint;
		public function set baseHp(value:uint):void {
			_baseHp = value;
		}
		public function get baseHp():uint {
			return _baseHp;
		}
		
		private var _baseMinRange:uint;
		public function set baseMinRange(value:uint):void {
			_baseMinRange = value;
		}
		public function get baseMinRange():uint {
			return baseMinRange;
		}
		
		private var _baseMaxRange:uint;
		public function set baseMaxRange(value:uint):void {
			_baseMaxRange = value;
		}
		public function get baseMaxRange():uint {
			return _baseMaxRange;
		}
		
		private var _baseMaxAngle:uint;
		public function set baseMaxAngle(value:uint):void {
			_baseMaxAngle = value;
		}
		public function get baseMaxAngle():uint {
			return _baseMaxAngle;
		}
		
		private var _baseDamage:uint;
		public function set baseDamage(value:uint):void {
			_baseDamage = value;
		}
		public function get baseDamage():uint {
			return _baseDamage;
		}
		
		private var _baseAccuracy:Number;
		public function set baseAccuracy(value:Number):void {
			_baseAccuracy = value;
		}
		public function get baseAccuracy():Number {
			return _baseAccuracy;
		}
		
		private var _baseFireRate:uint;
		public function set baseFireRate(value:uint):void {
			_baseFireRate = value;
		}
		public function get baseFireRate():uint {
			return _baseFireRate;
		}
		
		private var _baseRotationSpeed:Number;
		public function set baseRotationSpeed(value:Number):void {
			_baseRotationSpeed = value;
		}
		public function get baseRotationSpeed():Number {
			return _baseRotationSpeed;
		}
		
		private var _baseMaxAmmo:uint;
		public function set baseMaxAmmo(value:uint):void {
			_baseMaxAmmo = value;
		}
		public function get baseMaxAmmo():uint {
			return _baseMaxAmmo;
		}
		
		private var _hp:uint;
		public function set hp(value:int):void {
			_hp = value
		}
		public function get hp():int {
			return _hp;
		}
		
		private var _minRange:uint = 0;
		public function set minRange(value:uint):void {
			_minRange = value
		}
		public function get minRange():uint {
			return _minRange;
		}
		
		private var _maxRange:uint;
		public function set maxRange(value:uint):void {
			_maxRange = value
		}
		public function get maxRange():uint {
			return _maxRange;
		}
		
		private var _effRange:uint;
		public function get effRange():uint {
			_effRange = _minRange + 0.75*(_maxRange - _minRange);
			return _effRange;
		}
		
		private var _maxAngle:uint;
		public function set maxAngle(value:uint):void {
			_maxAngle = value;
		}
		public function get maxAngle():uint {
			return _maxAngle;
		}
		
		private var _damage:uint;
		public function set damage(value:uint):void {
			_damage = value;
		}
		public function get damage():uint {
			return _damage;
		}
		
		private var _accuracy:Number;
		public function set accuracy(value:Number):void {
			_accuracy = value;
		}
		public function get accuracy():Number {
			return _accuracy;
		}
		
		private var _fireRate:uint;
		public function set fireRate(value:uint):void {
			_fireRate = value;
		}
		public function get fireRate():uint {
			return _fireRate;
		}
		
		private var _rotationSpeed:Number;
		public function set rotationSpeed(value:Number):void {
			_rotationSpeed = value;
		}
		public function get rotationSpeed():Number {
			return _rotationSpeed;
		}
		
		private var _maxAmmo:uint;
		public function set maxAmmo(value:uint):void {
			_maxAmmo = value;
		}
		public function get maxAmmo():uint {
			return _maxAmmo;
		}
		
		private var _ammo:uint;
		public function set ammo(value:uint):void {
			_ammo = value;
		}
		public function get ammo():uint {
			return _ammo;
		}
		
		public function fire():void {
			
		}
		
		public function reload():void {
			
		}
		
		public function step(event:GameEvent):void {
			
		}
		
		public function destroy():void {
			
		}
		
	}
}