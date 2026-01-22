shader_type spatial;

uniform sampler2D DEPTH_TEXTURE : hint_depth_texture, filter_linear_mipmap;
uniform vec3 albedo : source_color;
uniform vec2 main_texture_tiling;
uniform sampler2D main_texture: filter_nearest;
uniform vec2 wave_texture_tiling;
uniform sampler2D wave_texture;
uniform float noise_scale = 10.0;
uniform float height_scale = 0.15;
uniform float time_scale = 1;
uniform float edge_scale = 0.1;
uniform vec3 edge_color: source_color;

varying float height;
varying vec3 world_position;

void vertex() {
	world_position = (MODEL_MATRIX * vec4(VERTEX, 1.0)).xyz;
	height = texture(wave_texture, (world_position.xz/(vec2(1,1)/wave_texture_tiling)) / noise_scale + TIME * time_scale).r;
	VERTEX.y += (1.0/5.0*sin(world_position.x + world_position.y + time_scale*TIME)
				+ 1.0/6.0 * sin(3.0*(world_position.x + world_position.y)+ time_scale*TIME)
				+ 1.0/8.0 * sin(5.0*(world_position.x + world_position.y)+ time_scale*TIME))*height_scale;
}

void fragment() {
    float depth = texture(DEPTH_TEXTURE, SCREEN_UV).r;
    vec4 world_pos = INV_PROJECTION_MATRIX * vec4(SCREEN_UV * 2.0 - 1.0, depth, 1.0);
    world_pos.xyz /= world_pos.w;

    float depth_view_space = -world_pos.z;
    float z_dif = depth_view_space + VERTEX.z;
    float foam_mask = clamp(1.0 - (z_dif / edge_scale), 0.0, 1.0);
    vec3 texture_color = texture(main_texture, UV * main_texture_tiling).rgb;
    texture_color *= albedo;

    vec3 color_with_foam = mix(texture_color, edge_color, foam_mask);
    ALBEDO = color_with_foam;
}
