x -= scaled_size[0] - original_size[0];
y -= scaled_size[1] - original_size[1];
audio_stop_sound(PickUp_OpenBackpack_1)
audio_stop_sound(PickUp_OpenBackpack_2)
audio_play_sound(choose(PickUp_OpenBackpack_1, PickUp_OpenBackpack_2), 0, false);