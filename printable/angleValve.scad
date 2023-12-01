use<rotate_copy.scad>
use <piping/rfwn.scad>
use <mirror_copy.scad>
include <piping/ASA150.scad>

echo(ASA150[4]);
//projection() rotate([90,0,0])
scale(1/7)

body();
//translate([160/2,0,112])rotate([0,45,0])actuator();
//rfwn(ASA150[4],wall=10,rf=0,spigot=true);

module angleValve(angle=90){
    rotate([-90,0,angle]){
        body();
        translate([40,0,24]) rotate([0,-45,0]) actuator();
    }
}
module actuator(){
    translate([0,0,-10]) cylinder(h=25,d=50,$fn=6);
    translate([0,0,16]) cylinder(h=25,d=50,$fn=6);
    translate([0,0,31]) cylinder(h=125,d=80);
    translate([0,0,156]) cylinder(h=15,d=40);
    translate([-25,-40,31]) cube([50,15,125]);
}

module body(d=48.3,t=10){
    tf=17.5; //thickness of flange
    ff=200; //face to face
    l=ff-73;
    angle=45;
    difference(){
        union(){
            cylinder(h=l,d=d);
            translate([0,0,d*sin(45)])rotate([0,angle,0])
            cylinder(h=l/2,d=d);
        }
        translate([0,0,-1])cylinder(h=l+2,d=d-2*t,$fn=8);
        translate([0,0,d*sin(45)])rotate([0,angle,0])
        cylinder(h=l+2,d=d-2*t,$fn=8);
    }
    translate([-20,-d/2,0])cube([40,10,127]);
}

module branch(l=60){
    difference(){
        union(){
           translate([-l,0,0]) rotate([0,90,0]) cylinder(h=80,d=48.3);    //pipe run
           difference(){
                rotate([0,90,0]) translate([0,0,-l]) cylinder(25,d=65);
                for (i=[-1:2:1]){   //flats
                    translate([-l-1,-25+i*51.5,-25]) cube(50);
                }
            }
        }
        translate([-l-1,0,0]) rotate([0,90,0]) cylinder(h=100,d=38); //bore
    }
}

