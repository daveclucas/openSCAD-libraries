use <pneumatic/pu.scad>
switch();
module switch(){
    color("DarkSlateGray"){
        translate([0,0,-6]) cylinder(h=3,d=25);
        translate([0,0,-3]) cylinder(h=3,d=38);
        translate([0,0,-10.25]) cube([3,24,9.5],center=true);
    }
    translate([0,10,-15.5]) cylinder(h=1,d=2,$fn=20);
    translate([0,0,8]) cube([40,40,9],center=true);
    translate([0,0,17]) cube([35,21,13],center=true);
    translate([-20,-12.5,23]) cube([40,25,50]);
    translate([20,0,60]) pu();
    translate([-20,0,30]) rotate([0,0,180]) pu();
}
