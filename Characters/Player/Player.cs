using Godot;
using System;

public partial class Player : CharacterBody2D
{
	string facing = "Down";
	string state = "Idle";
	Vector2 inputVector = Vector2.Zero;
	AnimatedSprite2D animatedSprite;
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		animatedSprite = (AnimatedSprite2D)this.GetNode("AnimatedSprite2D");
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
		inputVector.X = (float) Input.GetActionStrength("ui_right") - Input.GetActionStrength("ui_left");
		inputVector.Y = (float) Input.GetActionStrength("ui_down") - Input.GetActionStrength("ui_up");
		inputVector = inputVector.Normalized();
		if (inputVector != Vector2.Zero)
		{
			state = "Run";
		}
		else
		{
			state = "Idle";
		}
		if (Mathf.Abs(inputVector.X) >= Mathf.Abs(inputVector.Y))
		{
			if (inputVector.X > 0)
			{
				facing = "Right";
			}
			else if (inputVector.X < 0)
			{
				facing = "Left";
			}
		}
		else if (Mathf.Abs(inputVector.X) < Mathf.Abs(inputVector.Y))
		{
			if (inputVector.Y > 0)
			{
				facing = "Down";
			}
			else if (inputVector.Y < 0)
			{
				facing = "Up";
			}
		}
		animatedSprite.Play(state + facing);
		Velocity = Velocity.MoveToward(inputVector * 80, (float)delta *500);
		this.MoveAndSlide();
	}
}
