DMC_4_4N_S();
module DMC_4_4N_S(){
    difference(){
        union(){
            cylinder(h=5,d=14.3,$fn=6);
            cylinder(h=23,d=10,$fn=20);
            translate([0,0,8])cylinder(h=12,d=14.3,$fn=6);
        }
        translate([0,0,-1])cylinder(h=25,d=6.35);
    }
}