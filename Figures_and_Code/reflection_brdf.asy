
size(10cm, 0);

import three;
import graph3;
import palette;

currentprojection = perspective((0, -2, 1.5));

draw(surface((1.5, -1.5, 0) -- (1.5, 1.5, 0) -- (-1.5, 1.5, 0) -- (-1.5, -1.5, 0) -- cycle), 
  lightgray + opacity(0.7));


draw((0,0,0)--(-2.7,2.7,0), white+opacity(0));


triple n = (0,0,1);

triple wi = unit((1,-1,1));
path3 incident_ray = 2wi -- (O+0.5*wi);

for (int i = 5; i > 0; --i) {
  draw(incident_ray, 
       orange + (i/2)*linewidth(1pt) + opacity(0.3), 
       Arrow3); 
}
draw(incident_ray, orange + linewidth(2pt), Arrow3(size=4), L="$\omega_i$");

triple reflect(triple v, triple n) {
  return 2*dot(v, n)*n - v;
}

triple brdf(pair uv) {
  real theta = uv.x;
  real phi = uv.y;

  triple wr = reflect(wi,n);

  triple w = (sin(theta)*cos(phi), sin(theta)*sin(phi), cos(theta));

  real r = 0.5 + 2*exp(-50*(acos(dot(w,wr))^1.5));

  return r*w;
}

surface lobe = surface(brdf, (0,0), (pi/2,2pi), 30, 30, Spline);
lobe.colors(palette(lobe.map(zpart), 
    Gradient(
        rgb(0.95,0.98,1.0), 
        rgb(1.0,0.98,0.9),    
        rgb(1.0,0.95,0.8)     
    )
));

draw(lobe, meshpen=nullpen);

triple n = unit((0, 0, 1));
triple wo = reflect(wi, n);