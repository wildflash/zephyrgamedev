package com.zephyr.game.levels {
	
	import com.zephyr.game.objects.*;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	import mx.utils.ObjectProxy;
	
	/*
	used to translate fla symbol object to be readable by game
	*/
	public class LevelTranslator {
		
		/*constructor*/
		public function LevelTranslator():void {
			
		}
		
		/*
		translate() will convert level elements into game objects/units.
		element's position & rotation will be passed too to game object.
		Later, swap element name with game object.
		*/
		public static function translate(levelMc:MovieClip):Object {
			var ob:Object = new ObjectProxy();
			
			for each(var area:MovieClip in levelMc) {
				if(area.name.indexOf("Area")>-1) {
					if(area.name.indexOf("player")>-1) { // player area
						ob.playerArea = new Object();
						//create array of game objects per area (will be added to game object layer)
						if(!ob.playerArea.gameObjects) ob.playerArea.gameObjects = new Array();
						for each(var go:Sprite in area) { //go = game object
							mapTo(go,ob.playerArea);
						}
					} else { //enemy area
						ob.enemyArea = new Object();
						//create array of game objects per area (will be added to game object layer)
						if(!ob.enemyArea.gameObjects) ob.enemyArea.gameObjects = new Array();
						for each(go in area) {
							mapTo(go,ob.enemyArea);
						}
					}
				}
			}
			
			return ob;
		}
		
		//dictionary function
		private static function mapTo(gameObject:Sprite, area:Object):void {
			var gon:String = gameObject.name;
			if(gon.indexOf("background")>-1) {
				area.bg = gameObject;
			} else {
				var temp:Object;
				if(gon.indexOf("bigGunPlatform")>-1) {
					temp = new BigGunPlatform();
				} else if(gon.indexOf("gunPlatform")>-1) {
					temp = new GunPlatform();
				} else if(gon.indexOf("soldierPost")>-1) {
					temp = new SoldierPost();
				} else if(gon.indexOf("x")>-1) {
					
				} else if(gon.indexOf("x")>-1) {
					
				} else if(gon.indexOf("x")>-1) {
					
				} else {
					temp = new BigGunPlatform();
				}
				temp.x = gameObject.x ;
				temp.y = gameObject.y;
				temp.rotation = gameObject.rotation;
				area.gameObjects.push(temp);
			} 
			
		}

	}
}