package com.zephyr.game.interfaces
{
	import com.zephyr.game.interfaces.guntype.IGunType;
	
	public interface IGun
	{
		
		function set gunPlatform(value:IGunPlatform):void;
		function get gunPlatform():IGunPlatform;
		
		function set level(value:uint):void;
		function get level():uint;
		function set exp(value:Number):void;
		function get exp():Number;
		function set kills(value:uint):void;
		function get kills():uint;
		
		function set state(value:uint):void;
		function get state():uint;
		
		function set gunTypes(value:Array):void;
		function get gunTypes():Array;
		function isHasType(type:IGunType):Boolean;
		
		function set baseHp(value:uint):void;
		function get baseHp():uint;
		function set baseMinRange(value:uint):void;
		function get baseMinRange():uint;
		function set baseMaxRange(value:uint):void;
		function get baseMaxRange():uint;
		function set baseMaxAngle(value:uint):void;
		function get baseMaxAngle():uint;
		function set baseDamage(value:uint):void;
		function get baseDamage():uint;
		function set baseAccuracy(value:Number):void;
		function get baseAccuracy():Number;
		function set baseFireRate(value:uint):void;
		function get baseFireRate():uint;
		function set baseRotationSpeed(value:Number):void;
		function get baseRotationSpeed():Number;
		function set baseMaxAmmo(value:uint):void;
		function get baseMaxAmmo():uint;
		
		function set hp(value:int):void;
		function get hp():int;
		function set minRange(value:uint):void;
		function get minRange():uint;
		function set maxRange(value:uint):void;
		function get maxRange():uint;
		function get effRange():uint;
		function set maxAngle(value:uint):void;
		function get maxAngle():uint;
		function set damage(value:uint):void;
		function get damage():uint;
		function set accuracy(value:Number):void;
		function get accuracy():Number;
		function set fireRate(value:uint):void;
		function get fireRate():uint;
		function set rotationSpeed(value:Number):void;
		function get rotationSpeed():Number;
		function set maxAmmo(value:uint):void;
		function get maxAmmo():uint;
		function set ammo(value:uint):void;
		function get ammo():uint;
		
		function fire():void;
		function reload():void;
	}
}