package main

import rl "vendor:raylib"
import "core:fmt"

vector2 :: [2]f32
vector2f32 :: [2]f32

main :: proc() {
	pair := vector2{1, 3}
	fmt.println(pair)
	// basic_window()
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

	ball_position := vector2f32{-100, -100}
	ball_color :: rl.DARKBLUE

	for !rl.WindowShouldClose() {
		ball_position = rl.GetMousePosition()


	}

}