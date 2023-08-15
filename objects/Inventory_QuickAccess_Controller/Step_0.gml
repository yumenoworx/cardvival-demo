if array_length(quick_access_array) != array_length(global.items)
{
	quick_access_array = global.items
	if length > 1 and second_slot == none
	{
		second_slot = quick_access_array[1];
	} else {
		second_slot = none;
	}
	if length > 2 and third_slot == none
	{
		third_slot = quick_access_array[2];
	} else {
		third_slot = none;
	}
}
// Heya!
if keyboard_key_press(ord("A"))
{
}
else if keyboard_key_press(ord("D"))
{
	if array_length(quick_access_array) < 4
	{
		
	}
}