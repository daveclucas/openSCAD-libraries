use <maleHeader.scad>
use<bezel.scad>

neopixelArray(n=8);
bezel(w=51.5,d=5,h=1.5,flange=3,shrinkage=[0.25,0.25,0]);

module neopixelArray(n=8,pitch=6.6,center=true){
    translation=(center) ? [-24.7,-5,1.5] : [0,0,0];
    translate([0,0,-3.1]+translation){  //set origin
        translate([0,0,1]) rotate([-90,0,90]) maleHeader(pins=4);
        difference(){
            for (i=[0:n-1]){
                translate([1.5+i*pitch,5,1.5])pixel();
            }
        }
        color("black") cube([54,10,1.5]);
    }
}

module pixel(size=[5,5,1.6],led=3.5){
    color("white")cube([5,5,1.6],center=true);
    color("yellow")cylinder(d=3.5,h=1.7,$fn=20,center=true);
}
