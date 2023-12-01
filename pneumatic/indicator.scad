use <mirror_copy.scad>

indicator(false);

module indicator(state=false){
    rotate([0,180,0]) translate([0,0,-4.4]) {
        color("Silver"){
            cylinder(h=4.4,d=26);
            cylinder(h=21,d=22);
            difference(){
                cylinder(h=53.6,d=20);
                mirror_copy([0,1,0]) translate([-13,8.5,47.5]) cube([26,2,6.5]);
                translate([0,0,-1]) cylinder(h=60,d=8);
            }
        }
            translate([0,0,-6]){
                if(state) color("green") sphere(d=15);
                else color("White") sphere(d=15);
                color("White") cylinder(h=6,d=15);
            }
        translate([0,0,10.5]) cylinder(h=3,d=30,$fn=6);
    }
}