package ;

import openfl.events.KeyboardEvent;
import openfl.events.MouseEvent;
import openfl.geom.Point;

class InputHandler {

  public function new() {
    trace("Input Handler initialized");

  }

  public var pressedKeys = [];
  public var pressedMouseKeys = [];
  public var currentMousePosition:Point = new Point(0,0);
  public var lastClick:Point = new Point(0,0);
  public var endedMouseCoords = [0,0];

  public function reset() {
    pressedKeys=[];
  }

  public function onkeydown(event:KeyboardEvent):Void {
    if(!pressedKeys.contains(event.charCode))
      pressedKeys.push(event.charCode);

    //trace(pressedKeys);
  }
  public function onkeyup(event:KeyboardEvent):Void {
    if(!!pressedKeys.contains(event.charCode))
      pressedKeys.remove(event.charCode);
  }

  public function onmm(event:MouseEvent):Void {
    currentMousePosition = new Point(event.stageX,event.stageY);
  }

  public function onrmbdown(event:MouseEvent):Void {
    if(!pressedMouseKeys.contains(0))
      pressedMouseKeys.push(0);

    lastClick = new Point(event.stageX,event.stageY);
  }

  public function onrmbup(event:MouseEvent):Void {
    if(!!pressedMouseKeys.contains(0))
      pressedMouseKeys.remove(0);
  }

  

}