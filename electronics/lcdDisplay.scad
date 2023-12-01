use <maleHeader.scad>
use<bezel.scad>

translate([0,0,-4.5])bezel(w=97,d=39.5,h=9.6,flange=2,t=1.5,shrinkage=[0.7,0.7,0.6]);
//lcdDisplay();

module lcdDisplay(center=true){
    translation=(center) ? [-98/2,-60/2,0] : [0,0,0];
    translate([0,0,-11.1]+translation){  //set origin
        translate([49.5,40,-2.5]) rotate([180,0,180]) i2cDriver();
        translate([11,17,11]) cube([76,26,.2]);
        translate([0.5,10.6,1.5]) color("black") cube([97,39.5,9.6]);
        difference(){
            color("green") cube([98,60,1.5]);
            for (i=[0:1],j=[0:1]){
                translate([2.6+i*93,2.3+j*55,-0.1]) cylinder(d=3.2,h=2,$fn=20);
            }
        }
    }
}

module i2cDriver(){
    color("black") translate([16,4,1.5]) cube([9,10.5,3]);  //chip
    translate([29,7.5,1.5]) color("blue") cube([7,7,5.5]);  //trimmer
    translate([38.75,4,0]) rotate([180,0,90]) maleHeader(pins=4,pinLength=11);
    translate([1.25,18.5,0]) rotate([180,0,]) maleHeader(pins=16,pinLength=11);
    color("black") cube([41.5,19,1.5]); //pcb
}
