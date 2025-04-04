import graph;
import geometry;
import three;
import solids;
import math;
usepackage("amsmath"); 

size(25cm,0);

currentprojection = perspective(-6, -10, 1, zoom = 0.8);  

real width = 2;


pen p=lightgrey+opacity(0.1);



triple A = (0.5*width,0,0), B = (0.5*width,width,0), C = (0.5*width,width,width), D = (0.5*width,0,width);   


path3 edges[] = {
  A--B--C--D--cycle,  
};

surface plane = surface(A--B--C--D--cycle);

draw(plane, p);




int N = 4;
real radius = 0.015;
real space = 0.1;
real start = ((width-((N-1)*space))/2);


for(int i=0; i<N; ++i){
  for(int j=0; j<N; ++j){
    draw(shift((0,start+i*space,start+j*space))*scale(radius,radius,radius)*unitsphere, opacity(0.8)+red,currentlight);
  }
}

draw(shift(0.3, 1, 1)*scale(0.01,0.01,0.01)*unitsphere, black);




for(int i=0; i<N; ++i){
  for(int j=0; j<N; ++j){
    pen faint_orange = rgb(1.0, 0.6, 0.2) + opacity(0.7);
    pen fainter_orange = rgb(1.0, 0.6, 0.2) + opacity(0.5);
    triple plane_pos = ((0,start+i*space,start+j*space)+((0.3,1,1)-(0,start+i*space,start+j*space))/0.3);
    real y, z;
    if ((start+i*space) > 1) {
      y = -2;
    } else {
      y = 2;
      }
    if ((start+j*space) > 1) {
      z = -2;
    } else {
      z = 2;
      }
    if (i == 3 && j == 1) {
      faint_orange = red;
      fainter_orange = red;
    }
    real r1 = 1 + y * (unitrand());
    real r2 = 1 + z * (unitrand());
    draw(plane_pos--(0,start+i*space,start+j*space), faint_orange + linewidth(1pt), Arrow3(size=4));
    draw((-1,r1,r2)--plane_pos, fainter_orange + linewidth(1pt));
  }
}

draw((0,1,1)--(3.5,1,1), white+opacity(0));
draw((0.3,1,1)--(0.3,1,3.5), white+opacity(0));

label(Label("$L_o(\boldsymbol{x}\rightarrow\boldsymbol{\omega_o})$", fontsize(1pt)),   (0.65, 0.8, 1.00));
label(Label("$Pixels$", fontsize(1pt)),   (0, 1, 1.2));
label(Label("$Focal Point$", fontsize(1pt)),   (0.3, 1, 0.9));



