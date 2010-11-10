package com.zephyr.utils.debug {
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.TextEvent;
	import flash.text.TextField;
	import flash.system.System;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import flash.display.BlendMode;
 
	public class CMemoryAndFps extends MovieClip {
		private var _mem_txt:TextField;
		private var _fps_txt:TextField;
		private var _frameNum:Number;
 
		public function CMemoryAndFps(_txtColor:uint = 0xFF0000) {
			_mem_txt = new TextField();
			_mem_txt.name = "mem_txt";
			_mem_txt.textColor = _txtColor;
			_mem_txt.blendMode = BlendMode.INVERT;
			//_mem_txt.background = true;
			//_mem_txt.backgroundColor = 0xFFFFFF;
			_mem_txt.cacheAsBitmap = true;
			_mem_txt.selectable = false;
			addChild(_mem_txt);
 
			_fps_txt = new TextField();
			_fps_txt.name = "fps_txt";
			_fps_txt.y = 12;
			_fps_txt.textColor = _txtColor;
			_fps_txt.blendMode = _mem_txt.blendMode;
			//_fps_txt.background = true;
			//_fps_txt.backgroundColor = 0xFFFFFF;
			_fps_txt.thickness = 11;
			_fps_txt.cacheAsBitmap = true;
			_fps_txt.selectable = false;
			addChild(_fps_txt);
 
			var refreshTimer:Timer = new Timer(1000);
			refreshTimer.addEventListener(TimerEvent.TIMER, _refreshTimerHandler, false, 0, true);
			refreshTimer.start();
 
			this.addEventListener(Event.ENTER_FRAME, _enterFrameHandler, false, 0, true);
		}
 
		private function _refreshTimerHandler(e:TimerEvent):void {
			_mem_txt.text = Number(System.totalMemory / 1024 / 1024 ).toFixed( 2 ) + " Mb";
			_fps_txt.text = _frameNum + " fps";
			//trace(Math.floor(Math.random()*2));
			//trace(_mem_txt.text);
			//trace(_fps_txt.textColor);
			_frameNum = 0;
		}
 
		private function _enterFrameHandler(e:Event):void {
			_frameNum++;
		}
	}
}