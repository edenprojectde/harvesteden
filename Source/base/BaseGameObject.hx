package base;

import math.Point;
import openfl.display.Sprite;

class BaseGameObject extends Sprite {
  public var Position:Point;
  public var Rotation:Float;
  public var Origin:Point;
  public var IndexId : Int;
  public var UUID : String;
  public var Scene : BaseScene;

  public function new() {
    super();
    Position= new Point(10,10);
    Origin= new Point(0,0);
    Rotation=0;
    UUID = '${Math.random()*10000000000}';  
  }

  public function Update(env: Environment) {

  }

  public function Load(env: Environment) {
    
  }

  public function Draw() {

  }

  /**
    Returns Percentual Width of Canvas
  **/
  private function vw(amt:Float) {
    return Environment.CanvasWidth*amt/100;
  }

  /**
    Returns Percentual Height of Canvas
  **/
  private function vh(amt:Float) {
    return Environment.CanvasHeight*amt/100;
  }
}