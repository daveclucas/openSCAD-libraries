//module vBlock(l,w,h)
//purpose is to create a vee block with a vee groove for centering a cylindrical object for marking or drilling with a cylindrical groove at right angles to be used for gluing 2 cylindrical objects together. The hole is for drill clearance and to prevent glue squeeze from sticking to block. This can also be used as a 1-2-3 block..
//Example:scale(25)vBlock();

module vBlock(l=1,w=2,h=3){
    difference(){
        cube([l,w,h],center=true);
        translate([0,0,-(h+2)/2])rotate([0,0,-45])cube([l,l,h+2]);
        cylinder(h=4,d=.1,$fn=20,center=true);
        translate([0.55,0,0])rotate([90,0,0])cylinder(h=4,d=1,$fn=20,center=true);
        translate([0,h/2,0])rotate([90,45,0])cube([l,l,h]);
        rotate([0,90,0])cylinder(h=h,d=l,center=true,$fn=20);
    }
}