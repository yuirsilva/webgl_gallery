uniform sampler2D image;
uniform float hoverState;

varying vec2 vUv;
varying float vPoint;
varying vec3 vPosition;

void main() {
    vec2 uv = vUv;
    vec2 p_uv = floor(uv*20.)/20.;

    float p = pow(vPoint, 5.) * hoverState;
    vec2 f_uv = mix(uv, p_uv, p);

    vec4 img = texture2D(image, f_uv);

    gl_FragColor = img;
    // gl_FragColor = vec4(vPosition, 1.);

    // gl_FragColor = vec4(p_uv, 0., 1.);
    // gl_FragColor = vec4(p, 0., 0., 1.);
    // gl_FragColor = vec4(0., f_uv, 1.);
}