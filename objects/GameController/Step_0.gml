if keyboard_check_pressed(192) and !console_enabled
{
	console_enabled = true;
	input = "";
	return;
} else if keyboard_check_pressed(192) and console_enabled {
	console_enabled = false;
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