use <elbow.scad>
use <ASA150.scad>
include <rfwn.scad>

flangedElbow(radius=57.1,dims=ASA150[1]);

module flangedElbow(radius=57.1,dims=ASA150[1]){
    translate([0,0,dims[6]]) rotate([90,0,0]) elbow();
   // mirror_copy([1,1,0]) 
    translate([-(radius+dims[6]),0,(radius+dims[6])]) rotate([0,90,0]) rfwn(dims,wall=3.68);
    translate([0,0,0])  rfwn(dims,wall=3.68);
}