package base;

import openfl.display.Sprite;
import math.Point;

class BaseScene extends Sprite {
  private var EnvironmentInstance:Environment;
  public var GameObjects:Array<BaseGameObject> = [];
  public var Position:Point;
  public var Rotation:Float;
  public var Origin:Point;

  public function new() {
    super();

    Position= new Point(10,10);
    Origin= new Point(0,0);
    Rotation=0;
  }

  public function add<T>(object:T) {
    if(Std.is(object, BaseGameObject)) { 
      var objectBGO = cast(object,BaseGameObject);
      
      objectBGO.Scene = this;
      objectBGO.IndexId = GameObjects.push(objectBGO);

      this.addChild(objectBGO);
    };
  }

  public function removePerID(id:Int) {
    
  }

  public function removePerUUID(uuid:String) {
    this.GameObjects = this.GameObjects.filter(
      (e)->{
        return (e.UUID!=uuid);
      }
    );
  }

  public function Load(env:Environment) {
    this.EnvironmentInstance=env;
    for (obj in GameObjects)
			obj.Load(env);
  }

  public function Draw(time:Float) {
		for (scene in EnvironmentInstance.ActiveScenes) {
			for (gameobj in scene.GameObjects) {
				//gameobj.Draw(ctx);
			}
		}
	}

	public function Update() {

    if(!EnvironmentInstance.OverwriteUpdateActive)
		for (scene in EnvironmentInstance.ActiveScenes) {
			for (gameobj in scene.GameObjects) {
				gameobj.Update(EnvironmentInstance);
			}
    }
    else {
      EnvironmentInstance.OverwriteUpdate(EnvironmentInstance);
    }

		//window.setTimeout(Update, 1000 / 60);
	}
}