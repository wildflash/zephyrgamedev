package com.zephyr.abstracts
{
	import com.zephyr.game.StrongholdGame;
	
	import flash.filters.ShaderFilter;
	
	import mx.collections.ArrayCollection;
	
	public class GameShaderFilterFx extends GameFx
	{
		
		public var shaderFilter:ShaderFilter;
		
		public function GameShaderFilterFx(game:StrongholdGame):void {
			super(game);
		}
		
		private var _targetFilterArray:ArrayCollection = new ArrayCollection();
		public function get targetFilterArray():ArrayCollection {
			_targetFilterArray.source = this.targetDisplay.filters;
			return _targetFilterArray;
		}
		
		public function applyFilter(filter:ShaderFilter):void {
			this.targetFilterArray.addItem(filter);
			this.targetDisplay.filters = this.targetFilterArray.source;
		}
		
		public function removeFilter(filter:ShaderFilter):void {
			var idx:int = targetFilterArray.getItemIndex(filter);
			if(idx > -1) targetFilterArray.removeItemAt(idx);
			this.targetDisplay.filters = this.targetFilterArray.source;
		}
		
		/*public function getTargetFilterArray():void {
			this.targetFilterArray.source = this.targetDisplay.filters;
		}*/
		
	}
}