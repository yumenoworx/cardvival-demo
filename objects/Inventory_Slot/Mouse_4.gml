if object != noone and type != "resource"
{
	audio_play_sound(Card_Deal, 0, false);
	object = instance_create_layer(x, y, "Main", object);
	with object
	{
		x = room_width / 2 - sprite_width / 2
		y = room_height - (sprite_height+64) / 2;
	}
	array_delete(global.inventory, slot_index, slot_index+1);
	instance_destroy(self);
}