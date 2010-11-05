package com.zephyr.utils
{
    import flash.display.MovieClip;
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.ProgressEvent;
    
    import mx.events.FlexEvent;
    import mx.preloaders.DownloadProgressBar;

    /**
     * This class extends the lightweight DownloadProgressBar class.  This class
     * uses an embedded Flash 8 MovieClip symbol to show preloading.
     * 
     * @author jessewarden
     * 
     */    
    public class Preloader extends DownloadProgressBar
    {
        
        /**
        * The Flash 8 MovieClip embedded as a Class.
        */        
        //[Embed(source="/assets/Loader.swf", symbol="Preloader")]
        public var FlashPreloaderSymbol:Class;
        
        private var clip:MovieClip;
        
        public function Preloader()
        {
            super();
            
            // instantiate the Flash MovieClip, show it, and stop it.
            // Remember, AS2 is removed when you embed SWF's, 
            // even "stop();", so you have to call it manually if you embed.
            clip = new FlashPreloaderSymbol();
            clip.amount_txt.visible = false;
            addChild(clip);
            clip.gotoAndPlay("start");
        }
        
        private var _preloader:Sprite;
        public override function set preloader(preloader:Sprite):void 
        {                   
            preloader.addEventListener( ProgressEvent.PROGRESS ,     onSWFDownloadProgress );    
            preloader.addEventListener( Event.COMPLETE ,             onSWFDownloadComplete );
            preloader.addEventListener( FlexEvent.INIT_PROGRESS ,     onFlexInitProgress );
            preloader.addEventListener( FlexEvent.INIT_COMPLETE ,     onFlexInitComplete );
        }
        
        /**
         * Makes sure that the preloader is centered in the center of the app.
         * 
         */        
        private function centerPreloader():void
        {
        	if ((stage.stageWidth > 0) && (_preloader)) {
            	x = (stage.stageWidth / 2) - (clip.width / 2);
           		y = (stage.stageHeight / 2) - (clip.height / 2);
           		_preloader.visible = true;
         	}
        }
        
        /**
         * As the SWF (frame 2 usually) downloads, this event gets called.
         * You can use the values from this event to update your preloader.
         * @param event
         * 
         */        
        private function onSWFDownloadProgress( event:ProgressEvent ):void
        {
        	centerPreloader();
            var t:Number = event.bytesTotal;
            var l:Number = event.bytesLoaded;
            var p:Number = Math.round( (l / t) * 100);
            if(p >=0 && p<=100){
            	clip.gotoAndStop(p);
            	clip.amount_txt.text = String(p) + "%";
            }
            if(clip.currentFrame == 9){ clip.stop(); }
        }
        
        /**
         * When the download of frame 2
         * is complete, this event is called.  
         * This is called before the initializing is done.
         * @param event
         * 
         */        
        private function onSWFDownloadComplete( event:Event ):void
        {
            clip.addFrameScript(100, function ():void {
            	clip.stop();
            });
            clip.amount_txt.text = "100%";
        }
        
        /**
         * When Flex starts initilizating your application.
         * @param event
         * 
         */        
        private function onFlexInitProgress( event:FlexEvent ):void
        {
            //clip.preloader.gotoAndStop(100);
            clip.amount_txt.text = "Initializing...";
        }
        
        /**
         * When Flex is done initializing, and ready to run your app,
         * this function is called.
         * 
         * You're supposed to dispatch a complete event when you are done.
         * I chose not to do this immediately, and instead fade out the 
         * preloader in the MovieClip.  As soon as that is done,
         * I then dispatch the event.  This gives time for the preloader
         * to finish it's animation.
         * @param event
         * 
         */        
        private function onFlexInitComplete( event:FlexEvent ):void 
        {
            //clip.addFrameScript(100, onDoneAnimating);
			onDoneAnimating();
        }
        
        /**
         * If the Flash MovieClip is done playing it's animation,
         * I stop it and dispatch my event letting Flex know I'm done.
         * @param event
         * 
         */        
        private function onDoneAnimating():void
        {
            clip.stop();
            dispatchEvent( new Event( Event.COMPLETE ) );
        }
        
    }
}