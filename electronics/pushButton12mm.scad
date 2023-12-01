module pushButton12mm(color="green"){
    translate([0,0,-14.5]){ //set origin
        translate([0,0,10.5]) color("white") cylinder(r=11, h=2.5, $fn=6);
        translate([-1.5,3.8,-6]) color("white") cube([3,0.5,6]);
        translate([-1.5,-3.8,-6]) color("white") cube([3,0.5,6]);
        translate([0,0,16.7]) color(color) cylinder(d=12.7,h=4.1,$fn=20);
        translate([0,0,14.5]) cylinder(d=19,h=2.2,$fn=20);
        cylinder(d=15.5,h=14.5,$fn=20);
    }
}
pushButton12mm("red");