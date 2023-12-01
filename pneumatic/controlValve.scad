use <pneumatic/pu.scad>
use <pipe.scad>
use <mirror_copy.scad>
use <pu_msl.scad>

controlValve(port=3,dir=1);

module controlValve(id=0,port=3,dir=1){
    translate([0,0,15]){
        color("lightgrey") difference(){
            union(){
                cube([44,44,30],center=true);   //body
                cylinder(h=50,d=35);    //pilot
            }
            mirror_copy([1,1,0]){
                translate([12.1,12.1,8.1]) cube([10,10,10]);    //bolt recess
                translate([17,17,-20]) cylinder(h=30,d=6,$fn=20);   //mounting holes
            }
            cylinder(h=70,d=6,$fn=20);  //pilot
                for(i=[0:2]){   //ports
                    rotate([90,0,i*90]) cylinder(h=70,d=6,$fn=20);
            }
        }
    }
    //id label
    color("blue") translate([7,-20,30]) linear_extrude(.5) text(str("CV",id),size=5);
    translate([0,0,65]) rotate([90,0,180]) pu_msl();   //pilot
    translate([0,22,15]) rotate([0,180,0]) pu_msl();    //port1
    translate([0,-22,15]) rotate([180,0,0]) pu_msl();   //port3 
    //Port markings
    color("Blue"){ 
        translate([0,-22,2]) rotate([90,0,0]) 
        linear_extrude(.5) text(str(2),size=5);
        translate([22,0,2]) rotate([90,0,90]) 
        linear_extrude(.5) text(str(3),size=5);
        translate([0,22,2]) rotate([90,0,180]) 
        linear_extrude(.5) text(str(1),size=5);
    }

}
