knob(color="blue");
module knob(color="red"){
    translate([0,0,3]){
        cylinder(12,6,5,$fn=10);
        translate([0,0,11.1]) color(color) cylinder(1,r=4.5,$fn=20);
    }
}