use<BOSL/shapes.scad>
use<dowel.scad>
//Constants
t=10;   //thickness
translate([0,50,0])peg(5);
gauge(5);
$fn=20;

module peg(d){
    chamfer=d/20;
    dowel(d,t,chamfer);
    translate([0,0,1.5*d-2*chamfer])
    cuboid([d,d,d], fillet=d/10);
}

module hole(d){
    chamfer=-d/20;
    translate([0,1.5*d,0])dowel(d,t,chamfer);
    translate([0,-1.5*d,0])cube([d,d,t+2],center=true);
}

module gauge(d=10,n=2,clearance=0.02){
    for(i=[-n:n]){
        translate([i*1.5*d,0,0])
        difference(){
            cube([2*d,6*d,t],center=true);
            hole(d*(1+i*clearance));
        }
        translate([i*1.5*d,0,t/2])linear_extrude(0.2)
        text(str(i*d*clearance),size=d/2,halign="center",valign="center");
    }
}