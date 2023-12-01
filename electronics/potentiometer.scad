potentiometer();
module potentiometer(){
    cylinder(d=10.5,h=2,$fn=6);
    translate([0,0,-1.5]) cylinder(d=6.7,h=15);
    translate([-8,-1,-1.5]) cube([1.5,2.5,1.5]);
    translate([-7.5,-12.15,-3.5]) cube([15,9,1.2]);
    for (i=[0:2]){
        translate([i*5-5.5,-17,-4]) cube([1,5,.5]);
    }
    translate([0,0,-10.5]) cylinder(d=16.3,h=9);
}