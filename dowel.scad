use<mirror_copy.scad>

//module dowel(d,l,chamfer)
//d=diameter, le=length,chamfer=chamfer size
//create a dowel with a chamfer at each end. If chamfer is a negative value the dowel can be subtracted from a shape to create a chamfered hole

//Example 1: 
dowel(5,7,-0.5); //standard dowel
//Example 2:
/*difference(){
    cube([50,50,20],center=true);
    dowel(d=10,l=20,chamfer=-1);
}
*/
module dowel(d=10,l=30,chamfer=-1){
    $fn=100;
    union(){
        cylinder(h=l-2*abs(chamfer),d=d,center=true);
        mirror_copy([0,0,1])translate([0,0,(abs(chamfer)-l)/2])
        cylinder(h=abs(chamfer),r2=d/2,r1=d/2-chamfer,center=true);
    }
}
