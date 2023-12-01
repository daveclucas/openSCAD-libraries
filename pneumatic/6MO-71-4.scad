use <mirror_copy.scad>
6MO714();
module 6MO714(){
    color("lightGray"){
        cylinder(h=3.2,d=13.5,$fn=20);  //nut
        translate([0,0,3.2]) cylinder(h=9.6,d=16,$fn=6);    //nut
        translate([0,0,12.8]) cylinder(h=2.6,d=9.3,$fn=20); //uCut
        translate([0,0,15.4]) cylinder(h=5,d=15,$fn=6); //hex
        translate([0,0,22]) cylinder(h=5,d=15,$fn=6); //hex
        translate([0,0,19.4]) cylinder(h=30,d=12);  //long thread
        translate([0,0,35]){
            translate([0,0,3.2]) cylinder(h=9.6,d=16,$fn=6);
            cylinder(h=3.2,d=13.5,$fn=20);
        }
    }
}