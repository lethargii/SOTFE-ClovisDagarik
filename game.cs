using Godot;
using System;

public partial class Game : Node
{
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		GetNode<MainMenu>("MainMenu").Start += StartGame;
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
	}

	void ChangeScene(NodePath path)
	{
		PackedScene newLevel = (PackedScene)GD.Load(path);
		AddChild(newLevel.Instantiate());
		GetChild<Level>(0).ChangeLevel += ChangeScene;
	}

	void StartGame()
	{
		ChangeScene("res://Characters/Player/Player.tscn");
	}
}
