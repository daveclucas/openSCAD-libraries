use <maleHeader.scad>
use <led.scad>
use <connectorBlock.scad>
use <microPushButton.scad>

module SC08A(center=true){ //servo controller
    translation=(center) ? [-48.2/2,-46/2,0] : [0,0,0];
    translate(translation){
        translate([8,23,1.5]) microPushButton();
        translate([8,32,1.5]) microPushButton();
        translate([8,9.5,1.5]) rotate([0,0,90]) maleHeader(pins=4);
        translate([15.5,9.5,1.5]) rotate([0,0,90]) maleHeader(pins=4);
        translate([42,43,1.5]) rotate([0,0,180]) connectorBlock(n=2,color="green");
        for (i=[0:1]){
            translate([21.5,34+i*3,2]) rotate([0,90,0]) color("brown") cylinder(d=2.2,h=6.5,$fn=20);
        }
        for (i=[0:2]){
            translate([21.5,10+i*3,2]) rotate([0,90,0]) color("brown") cylinder(d=2.2,h=6.5,$fn=20);
        }
        translate([21,19,1.5]) color("grey") cube([8,12,3]);
        translate([22,5,1.5]) led(color="green");
        translate([27.5,5,1.5]) led(color="yellow");
        translate([33,3,1.5]) maleHeader(pins=3);
        for (i=[0:7]){
            translate([36,12+i*2.5,1.5]) maleHeader(pins=3);
        }
        difference(){
            color("black") cube([48.2,46,1.5]);
            for(i=[0:1],j=[0:1]){
                translate([3+i*41.8,3+j*38.4,-.2]) cylinder(d=2.6,h=2,$fn=20);
            }
        }
    }
}
SC08A();