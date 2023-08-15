if place_meeting(x, y, Card_Location_Forest) and !Card_Location_Forest.dragging
{
	show_debug_message("Forest.")
	global.prev_location = global.location;
	global.location = "forest";
}
else
{
	global.prev_location = global.location;
	global.location = noone;
}