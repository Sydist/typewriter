/// @desc Next Letter

pause = 0;
progress++;

var _char = string_copy(message, progress, 1);
var _charCode = ord(_char);

if (_charCode > 32) 
{
	instance_create_depth(x + xOffset, y + yOffset, depth, asset_get_index("obj_letter_" + effect), 
	{
		writerX: other.x,
		writerY: other.y,
		xOffset: other.xOffset,
		yOffset: other.yOffset,
		writerId: other.id,
		shake: other.shake,
		wave: other.wave,
		index: other.progress,
		image_angle: other.charAngle,
		image_xscale: other.xscale,
		image_yscale: other.yscale,
		image_alpha: other.charOpacity,
		image_blend: other.color,
		sprite_index: other.sprite,
		image_index: string_pos(_char, ASCII) - 1,	
	});
	
	
	audio_play_sound(sound ?? snd_nothing, 0, false);
}

draw_set_font(font);
xOffset += (((string_width(_char) * xscale) * !monospace) + (hsep * xscale)) * dcos(angle)
yOffset += (((string_height(_char) * yscale) * !monospace) + (vsep * yscale)) * -dsin(angle)

commandCheck();

isOver = (progress >= length);
if (isOver && canContinue)
{	
	alarm[1] = 1;
	alarm[2] = -1;
	exit;
}

alarm[0] = spd + pause;
