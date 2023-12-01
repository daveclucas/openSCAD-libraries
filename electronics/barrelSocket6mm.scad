module barrelSocket6mm(){
    translate([-1.1,6,0]) color("white") cube([2.5,4.2,0.2]);
    translate([-1.1,6,6]) color("white") cube([2.5,4.2,0.2]);
    translate([-4.8,6,1.75]) color("white") cube([0.2,4.2,2.5]);
    translate([0,0,4.1]) color("white") cylinder(d=2.2,h=9,$fn=20);
    difference(){
        union(){
            translate([-4.6,-4.6,10.3]) cube([9.2,11,3.3]);
            translate([-4.6,0,0]) cube([9.2,6.4,13.6]);
            cylinder(d=9.2,h=13.6,$fn=20);
        }
            translate([0,0,4.1]) cylinder(d=6.2,h=9.6,$fn=20);
    }
}
barrelSocket6mm();