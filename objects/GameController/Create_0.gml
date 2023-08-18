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
for (i = 1; i < global.spawner_count; i++)
{
	spawner = instance_create_layer(0, 0, "Main", CardSpawner)
	spawner.image_xscale = 0.4;
	spawner.image_yscale = 0.4;
	spawner.x = room_width/2-spawner.sprite_width/2*global.spawner_count-32;
	spawner.y = room_height/2-spawner.sprite_height/2+LocationField.y+32;
}