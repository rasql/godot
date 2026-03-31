shader_type canvas_item;

uniform float my_float: hint_range(1.0, 10.0) = 5.0;
uniform int my_int: hint_range(0, 100);
uniform bool my_bool = true;

void vertex() {
	float speed = 4.0;
	float d = 70.0;
	
	if (VERTEX.y < 0.0 && VERTEX.x < 0.0)
	{
		vec2 circle = vec2(d * cos(speed * TIME), d * sin(speed * TIME));
 		VERTEX += circle;
	}
}	

void fragment() {
	float v = 2.0;
	COLOR.r = 0.5 * cos(v * TIME) + 0.5;
	COLOR.b = 0.5 * sin(v * TIME) + 0.5;
	
	vec4 color1 = vec4(1.0, 0.0, 0.0, 1.0);
	vec4 color2 = vec4(0.0, 1.0, 0.0, 1.0);
	//COLOR = mix(COLOR, color2, 0.5);
	
	//COLOR = vec4(1.0, 0.5, 0.0, 1.0);
	// COLOR = texture(TEXTURE, UV);
}

