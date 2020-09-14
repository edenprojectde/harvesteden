package ;

import base.BaseScene;
import lib.base.*;

class Environment {
  public var ActiveScenes: Array<BaseScene> = [];
  public var InputHandler:InputHandler = new InputHandler();

  public static var ShowBorders = true;

  public static var CanvasHeight:Int = 720;
  public static var CanvasWidth:Int = 800;

  public static var ZoomLevel:Int = 2;
  public static var BaseSpriteDimension:Int = 32;
  public static var BaseChunkDimension:Int = 16;

  public static var GlobalOffsetX=100;
  public static var GlobalOffsetY=100;

  public var OverwriteUpdate : Dynamic;
  public var OverWriteEnvironment : Environment;
  public var OverwriteUpdateActive : Bool=false;

  public function new() {
    
  }
}