use <mirror_copy.scad>
clamp();
module clamp(dia=6.2,n=3,base=3,depth=10,hole=4,
lugs=true){
    height=dia/2+base;
    width=dia+4;
        for(i=[0:n-1]){
        translate([-i*width,-depth/2,0]) difference(){
            cube([width,depth,height]); //body
            translate([width/2,-1,dia/2+base]) rotate([-90,0,0]) cylinder(h=depth+2,d=dia,$fn=20);
            translate([0,0,base]) cube([1,depth,height-base]);  //relief
            translate([width-1,0,base]) cube([1,depth,height-base]);    //relief
            //translate([0,-0.1,dia/2+base-1]) cube([width,depth/2+.1,dia/2+1]);
        }   
    }
    translate([width*1.5,0,0]) lug(width,base,height,hole,socket=0);
    translate([width/2-width*n,0,0]) lug(width,base,height,hole,socket=1);
}
module lug(width=10,t=3,height=10,hole=4,socket=1){
    difference(){
        union(){
            translate([0,0,t/2]) cube([width,width,t],center=true);
            cylinder(h=height+t,d=hole+2+socket*2,$fn=20);
        }
        translate([0,0,-1]) cylinder(h=height+t+2,d=hole,$fn=20);
        if(socket) translate([0,0,t+.1]) cylinder(h=height+0.1,d=hole+socket*2,$fn=20);   //hole
    }
}
