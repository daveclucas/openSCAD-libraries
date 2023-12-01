use <rotate_copy.scad>

pu_msl(threadDia=5,tubeLength=50);
module pu_msl(i=1,threadDia=5,tubeLength=0){
    dims=[[4,10.4,16.25],[6,12.8,17.25]]; 
    rotate([-90,0,0]){
        tubeDia=dims[i][0];bodyDia=dims[i][1];fittingOD=dims[i][1];
        centres=dims[i][2];
        translate([0,0,-threadDia]) cylinder(h=threadDia,d=threadDia,$fn=20);
        translate([0,0,centres]) sphere(bodyDia/2);
        cylinder(h=centres,d=bodyDia,$fn=50);
        translate([0,0,centres]) rotate([0,90,0]) {cylinder(h=centres,d=bodyDia,$fn=50);
        cylinder(h=tubeLength,d=tubeDia,$fn=20);
    }
    }
}