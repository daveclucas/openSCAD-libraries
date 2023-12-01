include <BOSL/constants.scad>
use<BOSL/shapes.scad>
use<snapHook.scad>
use<mirror_copy.scad>
use<rotate_copy.scad>


rhsCap(w=25,d=25,h=2,t=2.5,hookLength=6);
 
module rhsCap(w=25,d=60,h=2,t=2.5,hookLength=6){
    translate([-w/2,-d/2,-h])cube([w,d,h]);
    for(i=[0:3])
    rotate_copy([0,0,i*90])translate([0,d/2-t-0.5,0])hook(l=hookLength,w=w/2);
  
    rhsCapHelp="\n**********************************************\n
    t=thickness of rhs
    h=wall thickness & height of cap flange
    rhsCap(w,d,h,t,f) width,depth,height,thickness,fillet\n
    Example: rhsCap(25,25,2,1);\n Note: fillet must be <= h/2 and <= t\n
    **********************************************\n
    ";
}