using Godot;
using System;

public partial class Level : Node2D
{
	[Signal]
	public delegate void ChangeLevelEventHandler(NodePath path);
	public override void _Ready()
	{
		ParallaxBackground background = GetNode<ParallaxBackground>("Background");
	}

	public override void _Process(double delta)
	{
		if (Input.IsActionJustPressed("pause"))
		{
			GetTree().Paused = true;
			PackedScene pauseMenu = (PackedScene)GD.Load("res://UI/PauseMenu/PauseMenu.tscn");
			AddChild(pauseMenu.Instantiate());
		}
	}
}
