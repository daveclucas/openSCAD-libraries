use<piping/pipeODs.scad>
use<piping/saddle.scad>

echo(pipeOD(1/2));


module weldolet(
    branchOD=60.3,
    branchThickness=2,
    shellOD=219.1,
    shellThickness=8,
    a=30,
    b=15)
    {
    fillet=branchOD/2;
    l=shellOD/3;
    t=max(2,branchThickness); echo("t = ",t);
    minorAxis=branchOD+2*sin(a)*l;echo("minorAxis = ",minorAxis);
    majorAxis=branchOD+2*sin(b)*l;echo("majorAxis",majorAxis);
    difference(){
        translate([0,0,-fillet])hull(){
               cylinder(h=0.1,d=branchOD);
               translate([0,0,l])scale([1,majorAxis/minorAxis,1])
               cylinder(h=0.1,d=minorAxis);
        }
        translate([0,0,shellOD/2])rotate([90,0,0])
        cylinder(h=majorAxis+2,d=shellOD,center=true); 
        cylinder(h=3*fillet,d=branchOD,center=true,$fn=8);  
    }
    difference(){
        cylinder(h=shellThickness,d=branchOD,$fn=8);
        cylinder(h=shellThickness,d=branchOD-2*t,$fn=8);
    }
}