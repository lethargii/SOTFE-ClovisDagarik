using Godot;
using System;

public partial class Player : Character
{
public void Control(double delta){
    inputVector.X = (float) Input.GetActionStrength("ui_right") - Input.GetActionStrength("ui_left");
	inputVector.Y = (float) Input.GetActionStrength("ui_down") - Input.GetActionStrength("ui_up");

}
public override void _Process(double delta){
    Control(delta);
    base._Process(delta);
}
}
