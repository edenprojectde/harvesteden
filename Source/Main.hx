package;

import gameobjects.SelectionLayer;
import gameobjects.BackgroundLayer;
import openfl.system.System;
import openfl.display.Graphics;
import base.BaseScene;
import gameobjects.Player;
import openfl.display.FPS;
import openfl.events.KeyboardEvent;
import openfl.events.MouseEvent;
import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.Assets;
import openfl.events.Event;

class Main extends Sprite
{
  private var EnvironmentInstance:Environment = new Environment();
	public function new()
	{
    super();

    var SceneId = EnvironmentInstance.ActiveScenes.push(new BaseScene());
    var MainScene = EnvironmentInstance.ActiveScenes[SceneId - 1];
    var backgroundLayer = new BackgroundLayer();
    MainScene.add(backgroundLayer);
    var selectionLayer = new SelectionLayer();
    MainScene.add(selectionLayer);
    var player = new Player();
    MainScene.add(player);
    
    this.addChild(MainScene);
    this.addChild(new FPS());
    
    MainScene.Load(EnvironmentInstance);
    this.addEventListener(Event.ENTER_FRAME, Update);
    stage.showDefaultContextMenu = false;
    stage.addEventListener(KeyboardEvent.KEY_DOWN, EnvironmentInstance.InputHandler.onkeydown);
		stage.addEventListener(KeyboardEvent.KEY_UP, EnvironmentInstance.InputHandler.onkeyup);
		stage.addEventListener(MouseEvent.RIGHT_MOUSE_DOWN, EnvironmentInstance.InputHandler.onrmbdown);
		stage.addEventListener(MouseEvent.RIGHT_MOUSE_UP, EnvironmentInstance.InputHandler.onrmbup);
		stage.addEventListener(MouseEvent.MOUSE_MOVE, EnvironmentInstance.InputHandler.onmm);
  }

  public var pressedKeys = [];

  private function keyDown(event:KeyboardEvent):Void {
    if(!pressedKeys.contains(event.charCode))
      pressedKeys.push(event.charCode);
  }
  private function keyUp(event:KeyboardEvent):Void {
    if(!!pressedKeys.contains(event.charCode))
      pressedKeys.remove(event.charCode);
  }

  public function Update(event:Event):Void {
    if (EnvironmentInstance.InputHandler.pressedKeys.contains('f'.code)) {
      Environment.GlobalOffsetX -= 8;
		}
		if (EnvironmentInstance.InputHandler.pressedKeys.contains('g'.code)) {
			Environment.GlobalOffsetY += 8;
		}
		if (EnvironmentInstance.InputHandler.pressedKeys.contains('t'.code)) {
			Environment.GlobalOffsetY -= 8;
		}
		if (EnvironmentInstance.InputHandler.pressedKeys.contains('h'.code)) { 
			Environment.GlobalOffsetX += 8;
    }
		if (EnvironmentInstance.InputHandler.pressedKeys.contains('r'.code)) { 
			Environment.GlobalOffsetX = 0;
			Environment.GlobalOffsetY = 0;
    }
    for (i => scene in EnvironmentInstance.ActiveScenes) {
      scene.Update();
    }
  }
}
