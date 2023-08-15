if position_meeting(mouse_x, mouse_y, self)
{
	show_debug_message("что")
	if !dragging
	{
		dragging = true;
	} else {
		dragging = false;
	}
	return;
}

if dragging
{
	while x != mouse_x and y != mouse_y 
	{
	move_towards_point(mouse_x, mouse_y, 15)
	}
}