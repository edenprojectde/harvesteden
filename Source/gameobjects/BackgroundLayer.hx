package gameobjects;

import openfl.geom.Point;
import base.BaseGameObject;

import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.geom.Rectangle;
import openfl.display.*;
import openfl.Assets;

class BackgroundLayer extends base.BaseGameObject
{
  private var tilemap:Tilemap;
  private var tileset:Tileset;
  var relativePosition: Point = new Point(0,0);
  var bitmap:Bitmap;
	public function new()
	{
    super();
    
    tileset = new Tileset(Assets.getBitmapData("assets/earthv1.png"));
    var dtIndex = tileset.addRect(
      new Rectangle(Environment.BaseSpriteDimension, 
                      0, 
                      Environment.BaseSpriteDimension, 
                      Environment.BaseSpriteDimension));
    

    tilemap = new Tilemap(
      Environment.BaseChunkDimension * Environment.BaseSpriteDimension * Environment.ZoomLevel,
      Environment.BaseChunkDimension * Environment.BaseSpriteDimension * Environment.ZoomLevel, tileset, false);
	  addChild(tilemap);

    
    for(i in 0...Environment.BaseChunkDimension) {
      for(j in 0...Environment.BaseChunkDimension) {
        tilemap.addTile(new DirtTile(dtIndex,
          i*Environment.BaseSpriteDimension*Environment.ZoomLevel,
          j*Environment.BaseSpriteDimension*Environment.ZoomLevel,2,2));
      };
    };
  }

  override public function Update(env:Environment) {
    this.x = Environment.GlobalOffsetX;
    this.y = Environment.GlobalOffsetY;
  }
}

class DirtTile extends Tile {

	public function new(type:Int, x:Float, y:Float, scalex:Float, scaley:Float) {
    super(type, x, y, scalex,scaley);
    
  }
  

}