package main

import "core:fmt"
import "core:strconv"


main :: proc() {

	day := day_number_from_normal_day("2 Janvier")
	fmt.println(day)

	fmt.println(bion_day_from_normal_day("2 Janvier"))

	two_int, ok := strconv.parse_int("2")

	fmt.println("2 Janvier => ", day_number_from_normal_day("2 Janvier"))
}

two :: proc() -> int {
	return 2
}



day_number_from_normal_day :: proc(normal_day: string) -> int {
	for i in 1..=len(normal_days) {
		if normal_days[i] == normal_day {
			return i
		}
	}
	return 0
}

bion_day_from_normal_day :: proc(normal_day: string) -> string {
	day_number := day_number_from_normal_day(normal_day)
	return bion_days[day_number]
}


normal_days := map[int]string{
	1 = "1 Janvier",
	2 = "2 Janvier",
	3 = "3 Janvier",
	4 = "4 Janvier",
	5 = "5 Janvier",
	6 = "6 Janvier",
	7 = "7 Janvier",
	8 = "8 Janvier",
	9 = "9 Janvier",
	10 = "10 Janvier",
	11 = "11 Janvier",
}

bion_days := map[int]string{
	1 = "aion 1er cycle",
	2 = "bion 1er cycle",
	3 = "cion 1er cycle",
	4 = "dion 1er cycle",
	5 = "eion 1er cycle",
	6 = "fion 1er cycle",
	7 = "gion 1er cycle",
	8 = "hion 1er cycle",
	9 = "iion 1er cycle",
	10 = "jion 1er cycle",
	11 = "kion 1er cycle",
}