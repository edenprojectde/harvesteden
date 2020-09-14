package gameobjects;

import base.BaseGameObject;
import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.Assets;
import openfl.net.*;
import openfl.geom.Point;

class Player extends base.BaseGameObject
{
  var bitmap:Bitmap;
  var playerPermanence:SharedObject;
	public function new()
	{
    super();
    
    var bitmapData = Assets.getBitmapData ("assets/player.png");
    var bitmap = new Bitmap (bitmapData);
        addChild (bitmap);
    bitmap.x = -32;
    bitmap.y = -32;
    bitmap.scaleX=3;
    bitmap.scaleY=3;
    relativePosition = new Point(0,0);

    playerPermanence = SharedObject.getLocal("player");
    if(playerPermanence.data.posX == null) {
      
      trace("Player had no Data");
    } else {
      relativePosition.x = playerPermanence.data.posX;
      relativePosition.y = playerPermanence.data.posY;
    }
  }
  
  var speed = 3;
  var savingInterval = 180;
  var counter = 0;
  var mouseMovement = false;
  var mouseMovementTarget: Point;
  var relativePosition: Point;
  var moved=false;
  override public function Update(env:Environment) {
    moved=false; counter++;
    if (env.InputHandler.pressedKeys.contains('a'.code)) {
      relativePosition.x -= speed; moved=true;
		}
		if (env.InputHandler.pressedKeys.contains('s'.code)) {
			relativePosition.y += speed; moved=true;
		}
		if (env.InputHandler.pressedKeys.contains('w'.code)) {
			relativePosition.y -= speed; moved=true;
		}
		if (env.InputHandler.pressedKeys.contains('d'.code)) { 
			relativePosition.x += speed; moved=true;
    }
    if (env.InputHandler.pressedMouseKeys.contains(0)) { 
      mouseMovement = true;
      mouseMovementTarget = new Point(
        env.InputHandler.lastClick.x-relativePosition.x,
        env.InputHandler.lastClick.y-relativePosition.y);
      mouseMovementTarget.normalize(speed);
    }
    if(moved) {
      mouseMovement=false;
      trace("Player Data is being written");
      playerPermanence.data.posX = relativePosition.x;
      playerPermanence.data.posY = relativePosition.y;
      playerPermanence.flush();
    }

    if(mouseMovement) {
      relativePosition.x+=mouseMovementTarget.x;
      relativePosition.y+=mouseMovementTarget.y;

      var newMouseMovementTarget = new Point(
        env.InputHandler.lastClick.x-relativePosition.x,
        env.InputHandler.lastClick.y-relativePosition.y);
      newMouseMovementTarget.normalize(speed);
      
      if(mouseMovementTarget.x > 0)
        { if(newMouseMovementTarget.x < 0) {mouseMovement=false;} }
      if(mouseMovementTarget.y > 0)
        { if(newMouseMovementTarget.y < 0) {mouseMovement=false;} }
      if(mouseMovementTarget.x < 0)
        { if(newMouseMovementTarget.x > 0) {mouseMovement=false;} }
      if(mouseMovementTarget.y < 0)
        { if(newMouseMovementTarget.y > 0) {mouseMovement=false;} }
    }
    this.x=relativePosition.x + Environment.GlobalOffsetX;
    this.y=relativePosition.y + Environment.GlobalOffsetY;
  }
}
