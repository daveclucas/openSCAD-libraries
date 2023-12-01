//example
pipeBend(od=25.4, t=2.7, radius=150, startAngle=00, endAngle=90, startLength=100, endLength=200);

 module pipeBend(od, t, radius, startAngle=0, endAngle=180, startLength=0, endLength=0) {
    union() {
        // lower arm
        if (startLength>0) {
            rotate([0, 0, startAngle]) translate([radius + od/2, 0.02, 0])
            rotate([90, 0, 0]) difference() {
                cylinder(r=od/2, h=startLength);
            translate([0, 0, -1]) cylinder(r=(od/2-t), h=startLength+2);
            }
        }
        // upper arm
        if (endLength>0) {
            rotate([0, 0, endAngle]) translate([radius + od/2, -0.02, 0])
            rotate([-90, 0, 0]) 
            difference() {
                cylinder(r=od/2, h=endLength);
                translate([0, 0, -1]) cylinder(r=(od/2-t), h=endLength+2);
            }
        }
        // bend
        difference() {
            // torus
            rotate_extrude() translate([radius + od/2, 0, 0]) circle(r=od/2);

            // torus cutout
            rotate_extrude() translate([radius + od/2, 0, 0])circle(r=(od/2-t));
            // lower cutout
            rotate([0, 0, startAngle]) translate([-(radius+2*od/2+1) * (((endAngle - startAngle) <= 180)?1:0), -radius-2*od/2-2, -(od/2+1)]) cube([2*(radius+2*od/2+1), radius+2*od/2+2, 2*(od/2+1)]);
            // upper cutout
            rotate([0, 0, endAngle]) translate([-(radius+2*od/2+1) * (((endAngle - startAngle) <= 180)?1:0), 0, -od/2]) cube([2*(radius+2*od/2+1), radius+2*od/2+1, 2*(od/2+1)]);
        }
    }
}

