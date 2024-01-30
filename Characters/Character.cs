using Godot;
using System;

public partial class Character : CharacterBody2D
{
	string facing = "Down";
	string state = "Idle";
	public Vector2 inputVector = Vector2.Zero;
	AnimatedSprite2D animatedSprite;
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		animatedSprite = (AnimatedSprite2D)this.GetNode("Sprite");
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
Move(delta);
	}
	public void Move(double delta)
	{
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
