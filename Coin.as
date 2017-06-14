//12CoinSolution
class Coin extends MovieClip {
	var weight:Number;
	var imageindex:Number;
	var overPurse = 450;
	var myIndex;
	var coin_label;
	var clabel_mc:MovieClip;
	function Coin () {
		select_image ();
	}
	function select_image () {
		if (_root.unique_coins == -1) {
			clabel_mc.gotoAndStop (1);
			if (imageindex == '') {
				var randomimage = 1 + Math.floor (Math.random () * _root.number_of_coins);
				this.gotoAndStop (randomimage);
			} else {
				this.gotoAndStop (imageindex);
			}
		} else if (_root.unique_coins == -2) {
			clabel_mc.gotoAndStop (2);
			if (imageindex == '') {
				var randomimage = 1 + Math.floor (Math.random () * _root.number_of_coins);
				this.gotoAndStop (randomimage);
			} else {
				this.gotoAndStop (imageindex);
			}
		} else {
			clabel_mc.gotoAndStop (1);
			this.gotoAndStop (_root.unique_coins);
		}
		this.cacheAsBitmap
	}
	function onRollOver () {
		new mx.transitions.Tween (this, "_xscale", mx.transitions.easing.Strong.easeOut, _xscale, 100, .7, true);
		new mx.transitions.Tween (this, "_yscale", mx.transitions.easing.Strong.easeOut, _yscale, 100, .7, true);
		this.swapDepths (_parent.getNextHighestDepth ());
	}
	function onPress () {
		//new mx.transitions.Tween (this, "_xscale", mx.transitions.easing.Strong.easeOut, _xscale, 100, .5, true);
		//new mx.transitions.Tween (this, "_yscale", mx.transitions.easing.Strong.easeOut, _yscale, 100, .5, true);
		startDrag (this);
		//trace (imageindex + '    ' + weight + '    ' + _y);
	}
	function onRollOut () {
		trace (imageindex + '    ' + weight + '    ' + _y + '    ' + _name);
		if (_y > overPurse) {
		} else {
			new mx.transitions.Tween (this, "_xscale", mx.transitions.easing.Elastic.easeOut, _xscale, 84, .8, true);
			new mx.transitions.Tween (this, "_yscale", mx.transitions.easing.Elastic.easeOut, _yscale, 84, .8, true);
		}
	}
	function onReleaseOutside () {
		stopDrag ();
		coinMoved ();
	}
	function onRelease () {
		stopDrag ();
		coinMoved ();
	}
	function coinMoved () {
		if (_y < overPurse) {
			if (_x < 400) {
				//_root.fallright ();
				//update_location (whatCoin:Number, toWhere:Number)
				_root.update_location (myIndex, 1);
			} else {
				//_root.fallleft ();
				_root.update_location (myIndex, -1);
			}
		} else {
			//_root.center ();
			_root.update_location (myIndex, 0);
		}
	}
}
