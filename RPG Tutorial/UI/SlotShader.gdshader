shader_type canvas_item;

uniform bool empty = true;

void fragment() {
	vec4 color = texture(TEXTURE, UV);
	vec4 previous_color = color;
	if (empty) {
		previous_color = vec4(previous_color.r, previous_color.g, previous_color.b, previous_color.a/5.0);
	}
	COLOR = previous_color;
}