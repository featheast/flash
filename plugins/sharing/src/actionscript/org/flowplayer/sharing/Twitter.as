/*    
 *    Author: Anssi Piirainen, <api@iki.fi>
 *
 *    Copyright (c) 2009 Flowplayer Oy
 *
 *    This file is part of Flowplayer.
 *
 *    Flowplayer is licensed under the GPL v3 license with an
 *    Additional Term, see http://flowplayer.org/license_gpl.html
 */
package org.flowplayer.sharing {
    import org.flowplayer.view.Flowplayer;

    public class Twitter extends AbstractShareCommand {
        private static const TWITTER_URL:String = "http://twitter.com/intent/tweet?text={0}";

	private var _tweet:String = "{0} {1}";
	private var _subject:String = "";

        public function Twitter(player:Flowplayer) {
            super(player);
        }

        override protected function get popupDimensions():Array {
            return [1024,650];
        }

        override protected function get serviceUrl():String {
            return formatString(TWITTER_URL, formatString(_tweet, escape(_subject), parentPageUrl));
        }
	
	public function get tweet():String
	{
		return _tweet;
	}

	public function set tweet(value:String):void {
		_tweet = value;
	}

	[Value]
	public function get subject():String
	{
		return _subject;
	}

	public function set subject(value:String):void 
	{
		_subject = value;
	}
	
	
    }
}
