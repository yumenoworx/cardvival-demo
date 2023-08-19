if object != noone and type != "resource"
{
	window_set_cursor(cr_default);
	object = instance_create_layer(x, y, "Main", object);
	with object
	{
		x = room_width / 2 - sprite_width / 2
		y = room_height - (sprite_height+64) / 2;
	}
	array_delete(global.inventory, slot_index, slot_index+1);
	instance_destroy(self);
}