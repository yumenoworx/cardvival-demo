draw_set_font(Console);

if easter_egg
{
	layer_sprite_create("EG", irandom_range(0, room_width), irandom_range(0, room_height), choose(EasterEgg_1, EasterEgg_2, EasterEgg_3, EasterEgg_4, EasterEgg_5, EasterEgg_6));
	draw_text(irandom_range(0, room_width), irandom_range(0, room_height), "Kill me please!!!")
	if !alarmed
	{
		alarm[0] = room_speed * 10;
		alarmed = true;
	}
}