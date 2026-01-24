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

uniform float near_plane = 1.0;
uniform float far_plane = 40.0;
uniform float edge_scale = 0.1;
uniform vec3 edge_color: source_color;

varying float height;
varying vec3 world_position;

float edge(float depth){
	depth = 1.0 - 2.0 * depth;
	return near_plane * far_plane / (far_plane + depth * (near_plane - far_plane));
}

void vertex() {
	world_position = (MODEL_MATRIX * vec4(VERTEX, 1.0)).xyz;
	height = texture(wave_texture, (world_position.xz/(vec2(1,1)/wave_texture_tiling)) / noise_scale + TIME * time_scale).r;
	VERTEX.y += (1.0/5.0*sin(world_position.x + world_position.y + time_scale*TIME)
				+ 1.0/6.0 * sin(3.0*(world_position.x + world_position.y)+ time_scale*TIME)
				+ 1.0/8.0 * sin(5.0*(world_position.x + world_position.y)+ time_scale*TIME))*height_scale;
}

void fragment() {
    float depth_raw = texture(DEPTH_TEXTURE, SCREEN_UV).r;
    vec3 ndc = vec3(SCREEN_UV * 2.0 - 1.0, depth_raw);
    vec4 view = INV_PROJECTION_MATRIX * vec4(ndc, 1.0);
    float linear_depth = -view.z / view.w;
    
    float surface_depth = -VERTEX.z; 
    
    float z_dif = linear_depth - surface_depth;
    
    float foam_mask = clamp(z_dif / edge_scale, 0.0, 1.0);
    
    vec3 texture_color = texture(main_texture, UV * main_texture_tiling).rgb * albedo;
	
    ALBEDO = mix(edge_color, texture_color, foam_mask);
}
