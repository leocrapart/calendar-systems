package main

import "core:fmt"


Rectangle :: struct {
	x: f32,
	y: f32,
	width: f32,
	height: f32,
}

main :: proc() {
	rect := Rectangle{y = 1, x = 2, width = 3, height = 4}
	fmt.println(rect)
}