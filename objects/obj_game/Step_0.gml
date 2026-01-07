//if(!audio_is_playing(snd_wind)) audio_play_sound(snd_wind, 10, true);

global.Debug.ClearCount(10);

var btn = "P";

if(keyboard_check_pressed(ord(btn))) {
	global.EventBus.Emit("on_button_pressed", { button: btn } );
}