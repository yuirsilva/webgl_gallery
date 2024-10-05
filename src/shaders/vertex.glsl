uniform vec2 point;
uniform float hoverState;

varying vec2 vUv;
varying float vPoint;
varying vec3 vPosition;

float gain(float x, float k) {
    float a = 0.5*pow(2.0*((x<0.5)?x:1.0-x), k);
    return (x<0.5)?a:1.0-a;
}

void main() {
    vec3 pos = position;
    float p = 1. - length(point - uv);

    pos.z += (gain(p, 4.) * 50.) * hoverState;

    // Position
    vec4 modelPosition = modelMatrix * vec4(pos, 1.0);


    // Final position
    gl_Position = projectionMatrix * viewMatrix * modelPosition;

    // Varyings
    vPosition = modelPosition.xyz;
    vUv = uv;
    vPoint = p;
}