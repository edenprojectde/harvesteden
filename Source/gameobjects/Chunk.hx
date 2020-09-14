package gameobjects;

import base.BaseGameObject;

import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.geom.Rectangle;
import openfl.display.*;
import openfl.Assets;

class Chunk extends base.BaseGameObject
{

  public function new()
    {
      super();
      var backgroundLayer = new BackgroundLayer();
      this.addChild(backgroundLayer);
      var selectionLayer = new SelectionLayer();
      this.addChild(selectionLayer);
    }

}