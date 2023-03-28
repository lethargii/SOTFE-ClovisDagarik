using Godot;
using System;



public partial class MainMenu : Control
{
	[Signal]
	public delegate void StartEventHandler();
	game game;
	public override void _Ready()
	{
		game = GetParent<game>();
		GetNode<Button>("Buttons/StartButton").GrabFocus();
		GetNode<Button>("Buttons/StartButton").Pressed += StartButton;
		GetNode<Button>("Buttons/LoadButton").Pressed += LoadButton;
		GetNode<Button>("Buttons/OptionButton").Pressed += OptionButton;
		GetNode<Button>("Buttons/QuitButton").Pressed += QuitButton;

	}

	void StartButton()
	{
		EmitSignal("Start");
		QueueFree();
	}
	public void LoadButton()
	{

	}
	public void OptionButton()
	{

	}
	public void QuitButton()
	{
		GetTree().Quit();
	}
}
