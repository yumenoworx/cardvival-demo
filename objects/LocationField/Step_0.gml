if place_meeting(x, y, Card_Location_Forest) and !Card_Location_Forest.dragging
{
	instance_nearest(x, y, Card_Location_Forest).x = x;
	instance_nearest(x, y, Card_Location_Forest).y = y;
	global.prev_location = global.location;
	global.location = "forest";
}
else
{
	global.prev_location = global.location;
	global.location = noone;
}