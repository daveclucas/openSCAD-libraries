use <pneumatic/DK-LOK/DMC-4-4N-S.scad>

translate([-15,-15,-99])pushButtonValve();
module pushButtonValve(){
    cube([30,30,84]);
    translate([0,0,6])cube([40,30,15]);
    translate([0,0,24])cube([32,35,51]);
    translate([15,15,84]){
        cylinder(h=24,d=25.4);
        translate([0,0,6])cylinder(h=4,d=30,$fn=6);
        translate([0,0,15])cylinder(h=4,d=30,$fn=6);
        cylinder(h=45,d=8);
        translate([0,0,45])cylinder(h=8,d=50);
    }
    translate([16,35,50])rotate([0,90,90])DMC_4_4N_S();
    translate([16,0,40])rotate([0,-90,90])DMC_4_4N_S();
    translate([16,0,60])rotate([0,-90,90])DMC_4_4N_S();
}