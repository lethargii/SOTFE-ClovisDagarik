shader_type canvas_item;

uniform vec4 shadow_color : source_color;
uniform vec2 sprite_sheet_size = vec2(3800, 64);
uniform vec2 frame_size = vec2(60.0, 64.0);

void fragment() {
	vec4 texture_color = texture(TEXTURE, UV);
	vec2 current_point = sprite_sheet_size * UV;
	float row = floor(current_point.y / frame_size.y);
	float column = floor(current_point.x / frame_size.x);
	vec2 max_point = (frame_size * vec2(column, row)) + frame_size;
	vec2 new_uv = 1.0 - (max_point - current_point) / frame_size;
	COLOR + texture_color;
	COLOR.a -= new_uv.y;
	vec4 sprite = texture(TEXTURE, new_uv*2.0);
	vec4 shadow = sprite * shadow_color;
	COLOR.a = sprite.a + (1.0 - sprite.a) * shadow.a;
	COLOR.rgb = 1.0 / COLOR.a * (sprite.a * sprite.rgb + (1.0 - sprite.a) * shadow.a * shadow.rgb);
}
