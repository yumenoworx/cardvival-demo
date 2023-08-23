if place_meeting(x, y, Card_Location_Forest) and !Card_Location_Forest.dragging
{
	global.prev_location = global.location;
	global.location = "forest";
}
else
{
	global.prev_location = global.location;
	global.location = noone;
}