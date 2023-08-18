global.inventory = [];
global.player_hp = 100;
global.player_str = 3;
global.player_def = 0;
global.arraySize = 6;
global.spawner_count = 6;

for (i = 0; i < global.arraySize; i++){
	global.invert[i] = false;
	instance_create_depth(room_width/2-64*global.arraySize/2+64*i,room_height-64,0,cellsinv).cell=i; 
}

instance_create_layer(0, 0, "Main", LocationField);
with LocationField
{
	image_xscale = 0.4;
	image_yscale = 0.4;
	x = room_width/2-sprite_width/2
	y = room_height/2-sprite_height/2-123;
}
spawner = instance_create_layer(0, 0, "Main", CardSpawner)
with spawner
{
	image_xscale = 0.4;
	image_yscale = 0.4;
	x = room_width/2-sprite_width/2-sprite_width*global.spawner_count/2-32;
	y = room_height/2-sprite_height/2+LocationField.y+32;
	for (i = 0; i < global.spawner_count; i++)
	{
		furthest = instance_furthest(x, y, CardSpawner)
		n = furthest.x + sprite_width + 32;
		instance_create_layer(n, y, "Main", CardSpawner)
	}
}