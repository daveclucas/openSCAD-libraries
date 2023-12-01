include <BOSL/constants.scad>
use <BOSL/shapes.scad>
use<bezel.scad>
use <led.scad>

pitch=5;
bezel(w=pitch*8,d=2.5,h=3);
ledArray(pitch=5,n=8,center=true);

module ledArray(pitch=5,d=23,n=8,center=true){
    translation=(center) ? [-(n+1)*pitch/2,3.5-d,-1] : [0,0,0];    
    translate([0,0,-4.5]+translation){    //set origin
        color("green")cube([(n+1)*pitch,d,1.5]);
        for (i=[0:n-1]){
            translate([pitch+i*pitch,19.5,1.5]) led();
            translate([pitch+i*pitch,9,3]) resistor();
            //rotate([-90,0,0]) color("lightblue") cylinder(d=2.2,h=6,$fn=20);
        }
    }
}

module resistor(l=7,d=3,colors=["yellow","violet","brown"]){
    rotate([90,0,0]){
        color("gray")cyl(l, d, fillet=d/3,$fn=20);
        for(i=[0:2]){
            color(colors[1+i])translate([0,0,i*1])cylinder(h=0.5,d=2*d/3+0.05,$fn=20,center=true);
        }
    }
}

