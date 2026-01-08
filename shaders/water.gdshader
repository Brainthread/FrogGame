shader_type spatial;

uniform vec3 albedo : source_color;
uniform vec2 main_texture_tiling;
uniform sampler2D main_texture: filter_nearest;
uniform vec2 wave_texture_tiling;
uniform sampler2D wave_texture;
uniform float noise_scale = 10.0;
uniform float height_scale = 0.15;
uniform float time_scale = 1;

varying float height;
varying vec3 world_position;

void vertex() {
	world_position = (MODEL_MATRIX * vec4(VERTEX, 1.0)).xyz;
	height = texture(wave_texture, (world_position.xz/(vec2(1,1)/wave_texture_tiling)) / noise_scale + TIME * time_scale).r;
	VERTEX.y += 1.0/5.0*sin(world_position.x + world_position.y + time_scale*TIME)
				+ 1.0/6.0 * sin(3.0*(world_position.x + world_position.y)+ time_scale*TIME)
				+ 1.0/8.0 * sin(5.0*(world_position.x + world_position.y)+ time_scale*TIME);
}

void fragment() {
	vec3 col = texture(main_texture, UV/(vec2(1,1)/main_texture_tiling)).rgb;
	col *= albedo;
	ALBEDO.rbg = col;
}

