use <pneumatic/DK-LOK/DMC-4-4N-S.scad>
regulator();
module regulator(){
    cube([150,60,70]); //body
    //filter
    translate([40,0,35]) rotate([90,0,0]) cylinder(h=95,d=50);
    translate([40,-95,35]) sphere(d=50);
    translate([40,-115,35]) rotate([90,0,0]) cylinder(h=35,d=25);   
    //regulator
    translate([105,76,35]) rotate([90,0,0]) cylinder(h=16,d=60);
    translate([105,0,35]) rotate([90,0,0]) cylinder(h=50,d=35);
    translate([0,30,35])rotate([0,-90,0])DMC_4_4N_S();
    translate([150,30,35])rotate([0,90,0])DMC_4_4N_S();
}