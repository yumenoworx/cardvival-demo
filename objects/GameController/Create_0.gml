global.player_hp = 100;
global.player_str = 3;
global.player_def = 0;
global.arraySize = 6;
global.spawner_count = 6;
easter_egg = false;
alarmed = false;
depth = -1;

//for (i = 0; i < global.arraySize; i++){
//	global.invert[i] = false;
//	instance_create_depth(room_width/2-64*global.arraySize/2+64*i,room_height-64,0,cellsinv).cell=i; 
//}
location_field = instance_create_layer(0, 0, "Main", LocationField);
with location_field
{
	x = room_width / 2 - sprite_width / 2
	y = room_height/2 - sprite_height / 2 - 222;
}
spawner = instance_create_layer(0, 0, "Main", CardSpawner)
with spawner
{
	if global.spawner_count == 0
	{
		x = room_width/2 - sprite_width/2;
	} else {
		x = (room_width - sprite_width * global.spawner_count - 32 * (global.spawner_count - 1)) / 2
	}
	y = room_height/2 - sprite_height/2 + (LocationField.y-32);
	if global.spawner_count > 1
	{
		for (i = 0; i < global.spawner_count; i++)
		{
			x_next = (sprite_width + 32) * i;
			instance_create_layer(x + x_next, y, "Main", CardSpawner);
		}
	}
}
instance_create_layer(0, 0, "Main", InventoryController)