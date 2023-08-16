if global.html5_build and place_meeting(mouse_x, mouse_y, self) and mouse_check_button(mb_left)
{
	window_set_cursor(cr_none);
	dragging = true;
	x = mouse_x - grab_x;
	y = mouse_y - grab_y;
}

if global.html5_build and mouse_check_button_released(mb_left)
{
	window_set_cursor(cr_default);
	dragging = false;
	image_xscale = original[0];
	image_yscale = original[1];
}