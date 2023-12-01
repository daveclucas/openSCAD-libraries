//Module to create a cube which can be made hollow in any axis
// LibFile: hollowCube.scad
// FileGroup: Shapes
//====================================================

// Module: hollowCube()
// Description:
//   Creates a hollow cube.
// Usage:
//   hollowCube(l, d, h, t, axis[0,0,0]);
// Arguments:
//   l = Length(x) of cube.
//   d = Depth(y) of cube.
//   h = Height(z) of cube.
//   t = wall thickness of cube.
//   axis = defines axis to be hollowed
//===================================================
// Example:
//hollowCube(axis=[0,0,0],t=1); //solid
//translate([-40,60,0]) hollowCube(axis=[1,0,0],t=1); //hollow along x
//translate([-40,-60,0]) hollowCube(axis=[0,1,0],t=2); //hollow along y
//translate([-40,0,0])hollowCube(axis=[-40,60,1],t=3); //hollow along z
//translate([40,60,0]) hollowCube(axis=[1,1,0],t=3); //hollow along x & y
//translate([40,-60,0]) hollowCube(axis=[1,0,1],t=3); //hollow along x & z
//translate([40,0,0]) hollowCube(axis=[1,1,1],t=1); //hollow along all axes

module hollowCube(l=20,d=30,h=40,t=5,axis=[1,1,1]){
    difference(){
        cube([l,d,h],center=true);
        if(axis[0]>0)
            cube([l+2,d-2*t,h-2*t],center=true);
            echo(axis[0]);
        if(axis[1]>0)
            cube([l-2*t,d+2,h-2*t],center=true);
            echo(axis[0]);
        if(axis[2]>0)
            cube([l-2*t,d-2*t,h+2],center=true);
            echo(axis[0]);
    }
}