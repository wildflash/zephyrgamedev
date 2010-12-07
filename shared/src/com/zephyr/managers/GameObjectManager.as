package com.zephyr.managers
{
	import com.zephyr.events.GameObjectEvent;
	import com.zephyr.interfaces.IGameObject;
	
	import flash.events.EventDispatcher;
	
	import mx.collections.ArrayCollection;

	public class GameObjectManager extends EventDispatcher
	{
		
		private static var instance:GameObjectManager = new GameObjectManager()
		
		public function GameObjectManager():void {
			if(instance) {
				throw new Error("It is a Singleton and can only be accessed through Singleton.getInstance()");
			}
			this.addEventListener(GameObjectEvent.REMOVE_GAME_OBJECT, removeGameObject);
		}
		
		public static function getInstance():GameObjectManager {
			return instance;
		}
		
		private var gameObjects:ArrayCollection = new ArrayCollection();
		
		public function addGameObject(go:IGameObject):void {
			gameObjects.addItem(go);
		}
		
		public function removeGameObject(event:GameObjectEvent):void {
			var idx:int = gameObjects.getItemIndex(event.params);
			if(idx>-1) gameObjects.removeItemAt(idx);
			event.params = null;
		}
		
	}
}