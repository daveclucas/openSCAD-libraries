use<mirror_copy.scad>
use<mirror_copy.scad>
width=200;
depth=200;
thickness=2;
angle=60;
spacing=20;
rows=2*width/spacing;
cols=2*depth/spacing;
margin=2;
border=5;
xOffset=spacing/4;

mesh();


module mesh(w=width,d=depth,t=thickness,b=border,m=margin,s=spacing){
    difference(){
        translate([0,0,-t])cube([w,d,2*t]);//border
        translate([b,b,-(t+0.05)])cube([w-2*b,d-2*b,2*t+0.1]);
    }
    difference(){
        translate([0,0,-t/2])cube([w,d,t]);
        translate([-s/4,-s/2,-(t/2+0.05)])
        for(j=[0:s:s*rows/2]){
            for(i=[0:s/2:cols*s/2]){
                translate([i,j,0])diamond();
                translate([s/4+i,s/2+j,0])diamond();
            }
        }
    }
}
    
module diamond(s=spacing-margin,angle,t=thickness+2){
    path=[
    [-s/4,0],
    [0,s/2],
    [s/4,0],
    [0,-s/2]
    ];   
    translate([0,0,-t/2])linear_extrude(t+0.1)polygon(path);
}

