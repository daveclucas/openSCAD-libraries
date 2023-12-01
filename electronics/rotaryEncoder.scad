use <maleHeader.scad>

rotaryEncoder();

module rotaryEncoder(){
    translate([-17,-9,-9.5]){   //move origin
        difference(){
            color("black") cube([26.3,19.5,1.5]);
            for (i=[0:1]){
                translate([6.15+14*i,16.5,-0.1]) cylinder(r=1.1,h=2,$fn=20);
            }
        }
        translate([8.5,2.7,1.5]) color("green") cube([13.3,11.7,6.5]);
        difference(){
            translate([17,9,8]) color("white") cylinder(d=6.7,h=16,$fn=20);
            translate([18,5.5,17.1]) cube(7);
        }
        translate([3,1.75,1.5]) rotate([0,0,90]) maleHeader(pins=5,pinLength=7);
    }
}