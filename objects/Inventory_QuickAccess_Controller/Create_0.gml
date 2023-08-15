first_position = [640, 672];
second_position = [480, 704];
third_position = [800, 704];
length = array_length(global.items);
selected = global.items[0];
none = "Natsu is watching you <o>";
if length > 1
{
	second_slot = global.items[1];
} else {
	second_slot = none;
}
if length > 2
{
	third_slot = global.items[2];
} else {
	third_slot = none;
}

quick_access_array = global.items
selected_index = 0;