use <rotate_copy.scad>
use <mirror_copy.scad>
use <piping/elbow.scad>
use <piping/pipe.scad>

od=48.3;
radius=63.5;
scale(1/7)tee(od=48.3,id=35,radius=63.5);
module tee(od=48.3,id=35,radius=63.5){
    difference(){
        difference(){
            union(){
                translate([0,radius,0])rotate([0,90,0])
                cylinder(h=2*radius,d=od,center=true); //run
                translate([0,radius/2,0])
                cube([2*radius-0.1,radius-0.1,od],center=true); //branch body
            }
            mirror_copy([1,0,0])cutout(radius=radius);  //bend
            mirror_copy([1,0,0])translate([radius,0,0])
            rotate_extrude()translate([radius,0,0])circle(r=id/2,$fn=8); //bend bore
        }
        translate([0,radius,0])rotate([0,90,0])
        cylinder(h=3*radius,d=id,center=true,$fn=8); //run bore
    }
}

module cutout(od=48.3,radius=63.5){
    translate([radius,0,0])
    difference(){
        cylinder(h=od,r=radius,center=true);
        rotate_extrude()translate([radius,0,0])circle(r=od/2);
        for(i=[0:2])
        rotate_copy([0,0,-i*90])translate([0,0,-od/2])cube([2*radius,2*radius,od]);
    }
}