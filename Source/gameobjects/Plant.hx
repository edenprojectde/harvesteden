package gameobjects;

import base.BaseGameObject;
import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.Assets;

class Plants extends base.BaseGameObject
{
  var bitmap:Bitmap;
	public function new()
	{
    super();
    
    var bitmapData = Assets.getBitmapData ("assets/earthv1.png");
    var bitmap = new Bitmap (bitmapData);
        addChild (bitmap);
    bitmap.x = 0;
    bitmap.y = 0;
  }
}