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
	}
}
