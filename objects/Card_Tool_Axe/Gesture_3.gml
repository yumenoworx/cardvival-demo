if !global.html5_build
{
	window_set_cursor(cr_none);
	dragging = true;
	if can_move
	{
		x = mouse_x - grab_x;
		y = mouse_y - grab_y;
		mouse_xprevious = mouse_x;
		mouse_yprevious = mouse_y;
	}
	else
	{
		window_mouse_set(mouse_xprevious, mouse_yprevious);
	}
}