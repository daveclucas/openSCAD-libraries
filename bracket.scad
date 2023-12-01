use <slot.scad>
use <mirror_copy.scad>

bracket();

module bracket(w=80,d=100,h=80,t=10,sd=12,sl=20) {
    difference(){
        union(){
            cube([w+t,d,t]);  //base
            cube([t,d,h+t]);  //upright
        }
        translate([w/2+t,d/2,-1]) slot(sd,sl,t+2);
    }
    translate([0,d/2,0]) gusset(w,d,h,t);
}
module gusset(w,d,h,t){
    path=[[0,0],[w-t,0],[w-t,t],[t,h-t],[0,h-t]];
    rotate([90,0,0]) mirror_copy([0,0,1]) translate([t,t,d/2-2*t]) linear_extrude(t) polygon(path);
    }
