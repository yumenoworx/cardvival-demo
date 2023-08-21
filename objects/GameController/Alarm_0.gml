show_debug_message(fps);
if fps <= 5 
{
	show_message("Пока! <3");
	game_end();
} else {
	alarmed = false;
}