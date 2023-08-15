if keyboard_check_pressed(192) and !console_enabled
{
	show_debug_message("Console enabled.");
	console_enabled = true;
	input = "";
	return;
} else if keyboard_check_pressed(192) and console_enabled {
	show_debug_message("Console disabled.");
	console_enabled = false;
	return;
	input = "";
}

if console_enabled and keyboard_check_pressed(vk_enter)
{
	try
	{
		console_enabled = false;
		room_goto(asset_get_index(input))
	}
	console_enabled = false;
	return;
}

if console_enabled
{
	input = keyboard_string;
}