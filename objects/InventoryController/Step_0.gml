if global.inventory != inventory_previous
{
	slots = array_length(global.inventory);
	instance_destroy(Inventory_Slot);
	for (i = 0; i < slots; i++)
	{
		slots_arr[i] = instance_create_layer(room_width/2-81*slots/2+81*i, room_height-111, "Main", Inventory_Slot);
		slots_arr[i].sprite_index = global.inventory[i][$ "sprite"];
		slots_arr[i].image_xscale = 0.2;
		slots_arr[i].image_yscale = 0.2;
		slots_arr[i].slot_index = i;
		slots_arr[i].object = global.inventory[i][$ "object"];
		slots_arr[i].qty = global.inventory[i][$ "qty"];
		slots_arr[i].type = global.inventory[i][$ "type"];
		ini_open("save.me");
		ini_write_string("Character", "Inventory", json_stringify(global.inventory))
		ini_close();
		
	}
}