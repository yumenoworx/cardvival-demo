if place_meeting(x, y, Card_Location_Forest) and !Card_Location_Forest.dragging
{
	global.prev_location = global.location;
	global.location = "forest";
	if !audio_is_playing(Forest)
	{
		audio_play_sound(Forest, 0, true);
	}
}
else
{
	global.prev_location = global.location;
	global.location = noone;
	audio_stop_sound(Forest);
}