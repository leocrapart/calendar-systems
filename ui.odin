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


input_mouse_wheel :: proc() {

	screen_width := i32(800)
	screen_height := i32(450)
	rl.InitWindow(screen_width, screen_height, "raylib [core] example - mouse input")

	box_position_y := screen_width/2 - 40
	scroll_speed := 4.0

	for !rl.WindowShouldClose() {
		box_position_y -= rl.GetMouseWheelMove() * scroll_speed

		rl.BeginDrawing()

			rl.ClearBackground(rl.RAYWHITE)

			rl.DrawRectangle(screen_width/2 - 40, box_position_y, 80, 80, rl.MAROON)

			rl.DrawText("Use mouse wheel to move the cube up and down!", 10, 10, 20, rl.GRAY)
			rl.DrawText(rl.TextFormat("Box position Y: %03i", box_position_y), 10, 40, 20, rl.LIGHTGRAY);

		rl.EndDrawing()
	}
	rl.CloseWindow()
}