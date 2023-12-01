use <pu.scad>
use <mirror_copy.scad>

puTee();
module puTee(){
    rotate([0,0,90]) mirror_copy()pu();
        pu();
}