window_set_cursor(cr_default);
image_xscale = original[0];
image_yscale = original[1];
audio_stop_sound(PickUp_PutInBackpack);
audio_play_sound(PickUp_PutInBackpack, 0, false);
instance_destroy();