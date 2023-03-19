using Godot;
using System;

public partial class game : Node
{
	Node2D level;
	CanvasLayer ui;
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		level = (Node2D)GetNode("Level");
		ui = (CanvasLayer)GetNode("UI");
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
	}

	public void ChangeLevel(NodePath path)
	{
		PackedScene newLevel = (PackedScene)GD.Load("res://Characters/Player/Player.tscn");
		level.AddChild(newLevel.Instantiate());
	}
}
