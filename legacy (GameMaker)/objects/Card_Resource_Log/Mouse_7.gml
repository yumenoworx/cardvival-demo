image_xscale = original[0];
image_yscale = original[1];
x += scaled_size[0] - original_size[0];
y += scaled_size[1] - original_size[1];
audio_play_sound(PickUp_PutInBackpack, 0, false);
add_item("Log", sprite_index, Card_Resource_Log, 1, "resource");
instance_destroy();