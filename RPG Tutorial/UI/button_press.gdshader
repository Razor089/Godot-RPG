shader_type canvas_item;

uniform bool active = false;

void fragment() {
	vec4 previous_color = texture(TEXTURE, UV);
	vec4 green_mask = vec4(0.0, 0.2, 0.0, previous_color.a/5.0);
	if (active == true) {
		previous_color = previous_color + green_mask;
	}
	COLOR = previous_color;
}