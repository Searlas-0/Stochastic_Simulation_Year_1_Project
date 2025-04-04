import graph;
import geometry;
import math;
defaultpen(fontsize(8pt));
usepackage("amsmath"); 

size(10cm,0);

real width = 2;

real width_inner = 1.25;
real A = (width - width_inner)*0.5;
real B = 0.2;


real width_box = 0.75;
real box_center = (width - width_box)*0.5;
real box_x_pos = 0.05;

real x_light_scale = 0.2;
real y_light_scale = 0.1;
real x_light_pos = width*0.5;
real y_light_pos = 1.74;
pair light_pos = (x_light_pos, y_light_pos);



path p = box((0,0), (2,2));
path q = box((0,0), (width_inner, width_inner));
path b = box((0,0), (width_box, width_box));
path l = unitcircle;

draw(p, black);
draw(shift(A,B)*q, black);

draw((0,0)--(A, B));
draw((width,0)--(A + width_inner, B));
draw((0,width)--(A,B+width_inner));
draw((width,width)--(A+width_inner,B+width_inner));

filldraw(shift(box_center,box_x_pos)*b, white);


filldraw(xscale(x_light_scale)*yscale(y_light_scale)*shift(x_light_pos/x_light_scale, y_light_pos/y_light_scale)*l, yellow);

pair first_bounce = (1.8,1.3);
pair second_bounce = (width/2, box_x_pos+width_box);
pair third_bounce = (0.2,1.3);

draw((x_light_pos,y_light_pos)--first_bounce, orange, Arrow(size=15));

label(Label("$L_e(\boldsymbol{x_e}\rightarrow\boldsymbol{\omega_e})$"), filltype = Fill(white), (1.2,1.6));

draw(first_bounce--second_bounce, orange, Arrow(size=8));


real radius = 0.5;
pen faint_orange = rgb(1.0, 0.6, 0.2) + opacity(0.2);

for (int i=0; i<20; ++i) {
  real theta = pi/2 + i * (pi / 20);  
  real intensity = abs(cos(theta));  
  real arrow_size = 3 * intensity;  

  pair direction = radius * intensity * (cos(theta), sin(theta));  
  draw(first_bounce -- (first_bounce + direction), faint_orange, Arrow(size=arrow_size));
}

for (int i=0; i<20; ++i) {
  real theta = -pi/2 + i * (pi / 20);  
  real intensity = abs(cos(theta));  
  real arrow_size = 3 * intensity;  

  pair direction = radius * intensity * (sin(theta), cos(theta));  
  draw(second_bounce -- (second_bounce + direction), faint_orange, Arrow(size=arrow_size));
}

for (int i=0; i<20; ++i) {
  real theta = -pi/2 + i * (pi / 20);  
  real intensity = abs(cos(theta));  
  real arrow_size = 3 * intensity;  

  pair direction = radius * intensity * (cos(theta), sin(theta));  
  draw(third_bounce -- (third_bounce + direction), faint_orange, Arrow(size=arrow_size));
}

draw(second_bounce--third_bounce, orange, Arrow(size=4));


pen faint_white = rgb(1,1,1) + opacity(0.7);

label(Label("$L_i(\boldsymbol{\omega_i}\rightarrow\boldsymbol{x})$"), filltype = Fill(white), (1.2,0.9));


label(Label("$L_o(\boldsymbol{x}\rightarrow\boldsymbol{\omega_o})$"), filltype = Fill(white), (0.8,0.9));

label(Label("$A(\boldsymbol{x})$"), filltype = Fill(white), (1,0.7));
label(Label("$\boldsymbol{x_e}$"), filltype = Fill(yellow), (1,1.75));
label(Label("$\boldsymbol{\omega_i}$"), filltype = Fill(white), (1.4,1.05));
label(Label("$\boldsymbol{\omega_o}$"), filltype = Fill(white), (0.6,1.05));
label(Label("$g(\boldsymbol{\omega_i}\rightarrow\boldsymbol{\omega_o})$"), filltype = Fill(faint_white), (third_bounce+0.3));


