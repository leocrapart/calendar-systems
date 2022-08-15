package main

import "core:fmt"
import "core:strconv"
import "core:strings"
import "package1"

main :: proc() {
	fmt.println(package1.multiply(5, 6))
	run()
	// day_number := 224

	// bion_day := bion_calendar()[day_number -1]
	// normal_day := normal_calendar()[day_number -1]

	// fmt.println(bion_day)
	// fmt.println(normal_day)

	// ui()
}

// ui
// raylib input text


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

bion_calendar :: proc() -> [dynamic]string {
	cycles := [7]string{"1er cycle", "2e cycle", "3e cycle", "4e cycle", 
						"5e cycle", "6e cycle", "7e cycle"}

	alphabet := "abcdefghijklmnopqrstuvwxyz"

	days : [dynamic]string

	// first half of cycle
	for letter in alphabet {
		builder := strings.builder_make()
		strings.write_rune(&builder, letter)
		strings.write_string(&builder, "ion")
		day := strings.to_string(builder)
		append(&days, day)
	}

	// second half of cycle
	for letter in alphabet {
		builder := strings.builder_make()
		strings.write_rune(&builder, letter)
		strings.write_string(&builder, "ion bis")
		day := strings.to_string(builder)
		append(&days, day)
	}


	calendar : [dynamic]string

	for cycle in cycles {
		for day in days {
			builder := strings.builder_make()
			strings.write_string(&builder, day)
			strings.write_string(&builder, " ")
			strings.write_string(&builder, cycle)
			date := strings.to_string(builder)
			append(&calendar, date)
		}
	}

	return calendar
}

normal_calendar :: proc() -> [dynamic]string {
	months := [12]string{"Janvier", "Février", "Mars", "Avril", 
						"Mai", "Juin", "Juillet", "Aout",
						"Septembre", "Octobre", "Novembre", "Décembre"}


	calendar : [dynamic]string

	for month in months {
		for day in 1..=number_of_day_in_month(month) {
			builder := strings.builder_make()
			strings.write_int(&builder, day)
			strings.write_string(&builder, " ")
			strings.write_string(&builder, month)
			date := strings.to_string(builder)
			append(&calendar, date)
		}
	}

	return calendar
}

number_of_day_in_month :: proc(month: string) -> int {
	months_map := map[string]int {
		"Janvier" = 31,
		"Février" = 28,
		"Mars" = 31,
		"Avril" = 30,
		"Mai" = 31,
		"Juin" = 30,
		"Juillet" = 31,
		"Aout" = 31,
		"Septembre" = 30,
		"Octobre" = 31,
		"Novembre" = 30,
		"Décembre" = 31,
	}

	return months_map[month]
}