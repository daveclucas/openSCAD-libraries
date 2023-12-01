//===========================================
// LibFile: cylSeg.scad
//   Segment of a cylinder
// FileGroup: Shapes
//==========================================

// Module: cylSeg()
// Description:
//   Creates a segmentof a cylinder.
// Usage:
//   cylSeg(t, l, r, h);
// Arguments:
//   l = Length (long axis) of segment.
//   r = Outside radius of cylinder.
//   h = Height of cylinder segment.
//   t = wall thickness of cylinder(tube).
//   ---
// Example:
// cylSeg(l=40,r=20,h=5);   //solid
// cylSeg(l=40,r=20,h=5,t=01);  //hollow

module cylSeg(t=0,l=50,r=10,h=5){
    difference(){
        cylinder(h=l,d=2*r);
        if(t>0){
            translate([0,0,-1])cylinder(h=l+2,d=2*(r-t));
        }
        translate([-(r+1),-(r+h),-1])cube([2*r+2,2*r+2,l+2]);
    }

}