if !global.html5_build
{
	window_set_cursor(cr_none);
	dragging = true;
	x = mouse_x - grab_x;
	y = mouse_y - grab_y;
}