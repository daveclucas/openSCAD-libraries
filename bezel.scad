include <BOSL/constants.scad>
use<BOSL/shapes.scad>

//Example:
bezel(w=12*2.5,d=2.5,h=8.3,flange=2,t=1,shrinkage=[0.7,0.7,1]);

module bezel(w=12*2.5,d=2.5,h=8.3,flange=2,t=1,shrinkage=[0.5,0.2,0],circular=true){
    if(circular){
        echo("circular = ",circular);
        difference(){
            union(){
                cylinder(t,d=d+2*(flange+t),$fn=20);
                cylinder(h,d=d+2*t,$fn=20);
            }
            cylinder(h,d=d,$fn=20);
        }
    }
    else{
        difference(){
            union(){
                cube([w+2*t,d+2*t,h]+shrinkage,center=true);
                translate([0,0,(h-t)/2])cuboid([w+2*(t+flange),d+2*(t+flange),t]+shrinkage, fillet=t/2, edges=EDGE_TOP_FR+EDGE_TOP_RT+EDGE_FR_RT+EDGE_TOP_LF, $fn=24,center=true);
            }
            cube([w,d,h+2]+shrinkage,center=true);
        }
    }
}
