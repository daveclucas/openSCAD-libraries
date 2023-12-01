piezoBuzzer();
module piezoBuzzer(){
    translate([0,0,-10]){
        translate([3.2,0,-7]) color("white") cylinder(d=0.5,h=7);
        translate([-3.2,0,-7]) color("white") cylinder(d=0.5,h=7);
        difference(){
            cylinder(d=12,h=9);
            translate([0,0,7.1]) cylinder(d=2,h=2,$fn=20);
        }
    }
}