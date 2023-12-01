use <pneumatic/pu.scad>
use <pipe.scad>
timerFeed(length=45,port=2);
module timerFeed(length=100,port=2){
    translate([0,-16.25,0]) rotate([0,0,0]){
        pu(1,90);   //elbow
        pipe(od=6,t=1,l=length);
    }
    if (port==1)
        translate([0,-16.25,length]) rotate([-90,0,180]) 
        pu(1,3);  //tee
        
    if(port==2){
        rotate([90,0,0]) translate([12.7,0,0]) 
        cylinder(h=4,d=8,$fn=6);  //blank
    }
    if (port==4)
        rotate([90,0,0]) translate([-12.7,0,0]) 
        cylinder(h=4,d=8,$fn=6);  //blank
}
