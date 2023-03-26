shader_type canvas_item;

uniform vec4 shadow_color : source_color;
uniform float x_translation = 1.0;
uniform float y_translation = 0.5;

void fragment() {
	vec2 new_uv = UV;
	new_uv.y += (new_uv.y - 45.0/64.0) * y_translation/64.0;
	new_uv.x += (new_uv.y - 45.0/64.0) * x_translation/64.0/24.0;
	vec4 shadow = texture(TEXTURE, new_uv) * shadow_color;
	COLOR += shadow;
}
