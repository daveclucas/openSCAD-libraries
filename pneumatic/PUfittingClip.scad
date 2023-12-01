use <mirror_copy.scad>
dia=11;
n=1;
base=3;
width=dia+4;
depth=25;
height=dia/2+1.5*base;
hole=4;
for(i=[0:n-1]){
    translate([-i*width,-depth/2,0]) difference(){
        cube([width,depth,height]);
        translate([width/2,-1,dia/2+base]) rotate([-90,0,0]) 
        cylinder(h=depth+2,d=dia,$fn=20);
        mirror_copy([1,0,0]) translate([-0.1,-1,base+.1]) 
        cube([1,depth+2,height-base]);
        translate([width,depth/2,height+base]) cube([width*2,15,height*2],center=true);
    }

    difference(){  //mounting flange
    translate([width,-5,0]) cube([10,10,base]);
    translate([width+5,0,0]) cylinder(h=base*2,d=4,$fn=20);
    }
}
    
