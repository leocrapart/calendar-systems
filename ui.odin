package main

import rl "vendor:raylib"
import "core:fmt"
import "core:strings"

vec2 :: rl.Vector2
Rectangle :: rl.Rectangle

main :: proc() {
	// basic_window()
	// input_mouse()
	//input_mouse_wheel()
	input_text()
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
	screen_width := 800
	screen_height := 450
	rl.InitWindow(i32(screen_width), i32(screen_height), "raylib [core] example - mouse input")

	box_position_x := screen_width/2 - 40
	box_position_y := screen_height/2 - 40

	scroll_speed := 40

	for !rl.WindowShouldClose() {
		box_position_y -= int(rl.GetMouseWheelMove()) * scroll_speed

		rl.BeginDrawing()

			rl.ClearBackground(rl.RAYWHITE)

			rl.DrawRectangle(i32(box_position_x), i32(box_position_y), 80, 80, rl.MAROON)

			rl.DrawText("Use mouse wheel to move the cube up and down!", 10, 10, 20, rl.GRAY)
			rl.DrawText(rl.TextFormat("Box position Y: %03i", box_position_y), 10, 40, 20, rl.LIGHTGRAY);

		rl.EndDrawing()
	}
	rl.CloseWindow()
}

// from example :
// raylib.com/examples/text/loader.html?name=text_input_box
input_text :: proc() {
	// init
	max_input_chars :: 9

	screen_width := 800
	screen_height := 450
	rl.InitWindow(i32(screen_width), i32(screen_height), "raylib [core] example - mouse input")

	name := [9]rune{}
	letter_count := 0

	text_box := rl.Rectangle{f32(screen_width/2 - 100), 180, 225, 50}
	mouse_on_text := false
	frames_counter := 0

	rl.SetTargetFPS(10)

	for !rl.WindowShouldClose() {
		// update
		if rl.CheckCollisionPointRec(rl.GetMousePosition(), text_box) {
			mouse_on_text = true
		} else {
			mouse_on_text = false
		}

		if mouse_on_text {
			rl.SetMouseCursor(rl.MouseCursor.IBEAM)

			key := rl.GetCharPressed()
		
			for key > 0 {
				if key >= 32 && key <= 125 && letter_count < max_input_chars {
					name[letter_count] = key
					letter_count += 1
				}

				key = rl.GetCharPressed()
			}

			if rl.IsKeyPressed(rl.KeyboardKey.BACKSPACE) {
				letter_count -= 1
				if (letter_count < 0) {
					letter_count = 0
				}
				name[letter_count] = 0
				// delete letter at letter_count pos
			}
		} else {
			rl.SetMouseCursor(rl.MouseCursor.DEFAULT)
		}

		if mouse_on_text {
			frames_counter += 1
		} else {
			frames_counter = 0
		}


				// draw
		rl.BeginDrawing()

			rl.ClearBackground(rl.RAYWHITE)

			// upper text
			rl.DrawText("PLACE MOUSE OVER INPUT BOX!", 240, 140, 20, rl.GRAY)

			// input box background
			rl.DrawRectangle(i32(screen_width/2 - 100), 180, 225, 50, rl.LIGHTGRAY)
			
			// input box border
			if mouse_on_text {
				rl.DrawRectangleLines(i32(text_box.x), i32(text_box.y), i32(text_box.width), i32(text_box.height), rl.RED)
			} else {
				rl.DrawRectangleLines(i32(text_box.x), i32(text_box.y), i32(text_box.width), i32(text_box.height), rl.DARKGRAY)
			}

			// input box text
			rl.DrawText(runes_to_cstring(name[:]), i32(text_box.x) + 5, i32(text_box.y) + 8, 40, rl.MAROON)

			// lower text
			rl.DrawText(rl.TextFormat("INPUT CHARS: %i/%i", letter_count, max_input_chars), 315, 250, 20, rl.DARKGRAY)

			if mouse_on_text {
				if letter_count < max_input_chars {
					if ((frames_counter/20)%2) == 0 {
						// underscore char
						rl.DrawText("_", i32(text_box.x) + 8 + rl.MeasureText(runes_to_cstring(name[:]), 40), i32(text_box.y + 12), 40, rl.MAROON)
					}
				} else {
					// delete text
					rl.DrawText("Press BACKSPACE to delete chars...", 230, 300, 20, rl.GRAY)
				}
			}
		rl.EndDrawing()
	}
	rl.CloseWindow()
}


runes_to_cstring :: proc(runes: []rune) -> cstring {
        builder := strings.builder_make()
        for r in runes {
            strings.write_rune(&builder, r)
        }
        strings.write_rune(&builder, rune(0))

        res := strings.to_string(builder)
        return cstring(raw_data(res))
    }