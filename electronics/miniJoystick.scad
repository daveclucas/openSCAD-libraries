use <maleHeader.scad>
use<pcbClip.scad>
miniJoystick();
translate([13,0,4.5])rotate([0,90,0])
pcbClip(width=26,height=26,t=1.6);


module miniJoystick(){
    translate([-13.5,-6.5,-7]) rotate([0,0,90]) maleHeader(pins=5);
    difference(){   //knob
        color("grey") sphere(20);
        translate([0,0,-10]) cube(size=55,center=true);
    }
    difference(){   //pcb
        translate([0,0,-7.5]) color("black") cube([34,26,1.5],center=true);
        for (i=[-1:2:1],j=[-1:2:1]){
            translate([1+i*13.2,j*10.75,-8.6]) cylinder(d=2.6,h=2,$fn=20);
        }
    }
    translate([0,0,0]) color("white")cube([16,16,13],center=true); //body
    color("black") cylinder(r=5.2,h=17);
    difference(){
        color("black") sphere(15);
        translate([0,0,-10]) cube(size=30,center=true);
    }
}

