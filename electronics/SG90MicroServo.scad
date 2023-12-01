use<bezel.scad>
use<mirror_copy.scad>
include <BOSL/constants.scad>
use<BOSL/shapes.scad>
use<hook.scad>

shrinkage=[0.5,0.5,0.1];
//housing();
//SG90MicroServo();

difference(){
    cube([60,50,1.5],center=true);
    cube([36.5,30.5,2],center=true);
}
mirror_copy([0,1,0])translate([-5,15.25,0.75])cube([10,2,5]);


module SG90MicroServo(body=[23,12.5,22.5]+shrinkage,flange=[32,12.5,2.5]+shrinkage,spigot=[12.5,8.5]+[0.5,0],shaft=[4.8,12.3]+[0.5,0]){
    translate([0,0,-body.z/2+4])cube(body,center=true); //body
    difference(){
        translate([0,0,-flange.z/2]) cube(flange,center=true);
        mirror_copy([1,0,0])translate([14,0,0]) cylinder(d=1.5,h=6,$fn=20,center=true); //hole
    }
    translate([(body.x-spigot.x)/2,0,0]){ 
        cylinder(d=spigot.x,h=spigot.y,$fn=20); //spigot
        translate([-spigot.x/2,0,0])cylinder(d=6,h=spigot.y,$fn=20);
        cylinder(d=shaft.x,h=shaft.y,$fn=20);
    }
}

module housing(){
    difference(){
        translate([0,0,3])
        union(){
            translate([0,0,4.25])cuboid([40,35,1.5], fillet=0.7, edges=EDGE_TOP_FR+
            EDGE_TOP_RT+EDGE_FR_RT+EDGE_TOP_LF, $fn=24,center=true);
            cube([36,21,10],center=true);
         }
        scale(1.02)SG90MicroServo();
        translate([0,0,-3.5])cube([32.5,13,20],center=true);
    }
    mirror_copy([0,1,0])translate([0,-15,6.5])rotate([180,0,0])hook(l=5,y=0.25,w=10);
}