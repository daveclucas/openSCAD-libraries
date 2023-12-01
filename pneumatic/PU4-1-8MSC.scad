use <threads.scad>

difference(){
    union(){
        translate([0,0,13.4]) english_thread (diameter=0.38, threads_per_inch=27, length=1/4, taper=1/16);
        cylinder(h=13.4,d=12,$fn=6);
    }
    cylinder(h=30,d=4.2,$fn=20);
}