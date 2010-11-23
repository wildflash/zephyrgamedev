package com.zephyr.game.fx
{
	import flash.events.EventDispatcher;
	
	import mx.collections.ArrayCollection;
	
	public class FxManager extends EventDispatcher
	{
		
		private static var instance:FxManager = new FxManager()
		
		public var fxArray:ArrayCollection = new ArrayCollection();
		private var shaderTargets:ArrayCollection = new ArrayCollection();
		
		public function FxManager():void {
			if(instance) {
				throw new Error("It is a Singleton and can only be accessed through Singleton.getInstance()");
			}
			this.addEventListener(FxEvent.REMOVE_FX_OBJECT, removeFx);
		}
		
		public static function getInstance():FxManager {
			return instance;
		}
		
		public function addFx(fx:IFx):void {
			fxArray.addItem(fx);
			if(fx is GameShaderFilterFx) {
				
			}
		}
		
		public function removeFx(event:FxEvent):void {
			var idx:int = fxArray.getItemIndex(event.params);
			if(idx>-1) fxArray.removeItemAt(idx);
			event.params = null;
		}

	}
}