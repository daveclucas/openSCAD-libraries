use<flute.scad>
use<boss.scad>
/* [Dimensions] */
width=200;
depth=200;
height=50;
fluted=true;
flute=[20,2];
runnerHeight=5;/* [Tab Thickness(sides,front,base)] */
thickness=[2,3,2];
knobs=1;    // [0:1:2] 

drawer(width,depth,height,thickness,fluted,flute,knobs);

module drawer(
    w=200,
    d=200,
    h=50,
    t=[2,3,2],
    fluted=true,
    flute=[20,2],
    knobs=1,
    rH=5){
    difference(){
        union(){
            cube([w,d,h],center=true);  //exterior
            translate([0,-(d-t[1])/2,h/2])cube([w,t[1],rH],center=true);
        }
        translate([0,(t[1]-t[0])/2,t[2]])
        cube([w-2*t[0],d-(t[0]+t[1]),h],center=true);  //interior
    }
}
