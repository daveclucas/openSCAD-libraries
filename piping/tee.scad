use <rotate_copy.scad>
use <mirror_copy.scad>
use <elbow.scad>
use <pipe.scad>

tee(od=48.3,radius=63.5,t=5.05);

module tee(od=48.3,radius=57.1,t=3.68,spigot=0){
    rotate([180,0,0])
    translate([0,-radius,0]){
    elbow(od,t,radius);
    mirror([1,0,0]) 
    elbow(od,t,radius);
    }
//    translate([radius,radius,0]) 
    rotate([0,90,0])
    translate([0,0,-radius]) 
    pipe(od,t,l=2*radius);

}  
