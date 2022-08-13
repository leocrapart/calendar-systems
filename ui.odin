package main

import rl "vendor:raylib"
import "core:fmt"

vec2 :: rl.Vector2

main :: proc() {
	input_mouse()
}


basic_window :: proc() {
	rl.InitWindow(800, 450, "raylib [core] example - basic window")

	for !rl.WindowShouldClose() {
		rl.BeginDrawing()
			rl.ClearBackground(rl.RAYWHITE)
			rl.DrawText("Congrats! You created your first window!", 190, 200, 20, rl.LIGHTGRAY)
		rl.EndDrawing()
	}

	rl.CloseWindow()
}

input_mouse :: proc() {
	rl.InitWindow(800, 450, "raylib [core] example - mouse input")

	ball_position := vec2{-100, -100}
	ball_color := rl.DARKBLUE

	for !rl.WindowShouldClose() {
		ball_position = rl.GetMousePosition()

		if rl.IsMouseButtonPressed(rl.MouseButton.LEFT) {
			ball_color = rl.MAROON
		} else if rl.IsMouseButtonPressed(rl.MouseButton.MIDDLE) {
			ball_color = rl.LIME
		} else if rl.IsMouseButtonPressed(rl.MouseButton.RIGHT) {
			ball_color = rl.DARKBLUE
		}

		rl.BeginDrawing()

			rl.ClearBackground(rl.RAYWHITE)

			rl.DrawCircleV(ball_position, 40, ball_color)
			rl.DrawText("move ball with mouse and click mouse button to change color", 10, 10, 20, rl.DARKGRAY)

		rl.EndDrawing()
	}
	rl.CloseWindow()
}