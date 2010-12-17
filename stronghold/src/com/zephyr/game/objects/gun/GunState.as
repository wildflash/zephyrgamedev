package com.zephyr.game.objects.gun
{
	public class GunState
	{
		
		public static const IDLE:uint = 0xF00000;
		public static const TRACKING:uint = 0x0F0000;
		public static const FIRING:uint = 0x00F000;
		public static const LOCKING:uint = 0x000F00;
		public static const RELOADING:uint = 0x0000F0;
		public static const DESTROYED:uint = 0x00000F;

	}
}