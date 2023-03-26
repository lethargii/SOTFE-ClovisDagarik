using Godot;
using System;

public partial class level : Node2D
{
	public override void _Ready()
	{
		ParallaxBackground background = GetNode<ParallaxBackground>("Background");
	}

	public override void _Process(double delta)
	{
	}
}
