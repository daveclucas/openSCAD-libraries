//example
bentPipe(outerRadius=12.7, innerRadius=10, bendScale=50, startAngle=0, endAngle=180, lower_arm_length=100, upper_arm_length=200);

 module bentPipe(outerRadius, innerRadius, bendScale, startAngle=0, endAngle=180, lower_arm_length=0, upper_arm_length=0) {
    bendRadius=bendScale*(outerRadius-innerRadius);
    union() {
        // lower arm
        if (lower_arm_length>0) {
            rotate([0, 0, startAngle]) translate([bendRadius + outerRadius, 0.02, 0])
            rotate([90, 0, 0]) difference() {
                cylinder(r=outerRadius, h=lower_arm_length);
            translate([0, 0, -1]) cylinder(r=innerRadius, h=lower_arm_length+2);
            }
        }
        // upper arm
        if (upper_arm_length>0) {
            rotate([0, 0, endAngle]) translate([bendRadius + outerRadius, -0.02, 0])
            rotate([-90, 0, 0]) 
            difference() {
                cylinder(r=outerRadius, h=upper_arm_length);
                translate([0, 0, -1]) cylinder(r=innerRadius, h=upper_arm_length+2);
            }
        }
        // bend
        difference() {
            // torus
            rotate_extrude() translate([bendRadius + outerRadius, 0, 0]) circle(r=outerRadius);

            // torus cutout
            rotate_extrude() translate([bendRadius + outerRadius, 0, 0])circle(r=innerRadius);
            // lower cutout
            rotate([0, 0, startAngle]) translate([-(bendRadius+2*outerRadius+1) * (((endAngle - startAngle) <= 180)?1:0), -bendRadius-2*outerRadius-2, -(outerRadius+1)]) cube([2*(bendRadius+2*outerRadius+1), bendRadius+2*outerRadius+2, 2*(outerRadius+1)]);
            // upper cutout
            rotate([0, 0, endAngle]) translate([-(bendRadius+2*outerRadius+1) * (((endAngle - startAngle) <= 180)?1:0), 0, -outerRadius]) cube([2*(bendRadius+2*outerRadius+1), bendRadius+2*outerRadius+1, 2*(outerRadius+1)]);
        }
    }
}

