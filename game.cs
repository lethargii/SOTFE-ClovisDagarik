using Godot;
using System;

public partial class game : Node
{
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		GetNode<MainMenu>("MainMenu").Start += ChangeLevel;
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
	}

	public void ChangeLevel(NodePath path)
	{
		PackedScene newLevel = (PackedScene)GD.Load("res://Characters/Player/Player.tscn");
		AddChild(newLevel.Instantiate());
	}
}
