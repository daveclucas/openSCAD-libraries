use <mirror_copy.scad>
dia=6;
n=3;
base=3;
width=dia+4;
depth=10;
height=dia/2+1.5*base;
hole=4;
for(i=[0:n-1]){
    translate([-i*width,-depth/2,0]) difference(){
        cube([width,depth,height]);
        translate([width/2,-1,dia/2+base]) rotate([-90,0,0]) cylinder(h=depth+2,d=dia,$fn=20);
        translate([0,0,base]) cube([1,depth,height-base]);
        translate([width-1,0,base]) cube([1,depth,height-base]);
        translate([0,0,dia/2+base]) cube([width,depth/2,dia/2]);
    }

        mirror_copy([0,1,0]) translate([-(n-1)*width/2,-depth*1.5,0]) difference(){  //mounting flange
        cube([width,depth,base]);
        translate([width/2,depth/2,0]) cylinder(h=base,d=hole,$fn=20);
        }
    //pillars
        translate([width/2-(n-1)*width/2,depth,0]) difference(){
        cylinder(h=height,d=hole+2,$fn=20);
        cylinder(h=height+2,d=hole,$fn=20);
        }
        translate([width/2-(n-1)*width/2,-depth,0]) difference(){
        cylinder(h=height,d=hole+4,$fn=20);
        cylinder(h=height+2,d=hole+2,$fn=20);
        }
}
    
