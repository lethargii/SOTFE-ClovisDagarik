using Godot;
using System;

public partial class PauseMenu : CanvasLayer
{

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
		if (Input.IsActionJustPressed("pause"))
		{
			GetTree().Paused = false;
			QueueFree();
		}
	}
}
