package gameobjects;

import base.BaseGameObject;

import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.geom.Rectangle;
import openfl.display.*;
import openfl.Assets;

class SelectionLayer extends base.BaseGameObject
{
  private var tilemap:Tilemap;
  private var tileset:Tileset;
  private var info:Text;
  var bitmap:Bitmap;
	public function new()
	{
    super();
    
    trace("Selection Layer loaded");

    tileset = new Tileset(Assets.getBitmapData("assets/earthv1.png"));
    var dtIndex = tileset.addRect(new Rectangle(0, 64, 32, 32));
    

    tilemap = new Tilemap(64, 64, tileset, false);
	  addChild(tilemap);
    
    for(i in 0...16) {
      for(j in 0...16) {
        tilemap.addTile(new SelectionTile(dtIndex,i*64,j*64,2,2));
      };
    };
  }

  override public function Update(env:Environment) {
    this.x = Environment.GlobalOffsetX%64 -64 + 
              Math.floor((env.InputHandler.currentMousePosition.x)/64)*64;
    this.y = Environment.GlobalOffsetY%64 -64 + 
              Math.floor((env.InputHandler.currentMousePosition.y)/64)*64;
  }
}

class SelectionTile extends Tile {

	public function new(type:Int, x:Float, y:Float, scalex:Float, scaley:Float) {
		super(type, x, y, scalex,scaley);
	}
}