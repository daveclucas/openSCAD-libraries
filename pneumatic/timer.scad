use <pneumatic/dial.scad>
use <pneumatic/pu.scad>
use <pipe.scad>
use <pneumatic/timerFeed.scad>
use <valve5_2.scad>


timer(scale=10,port=2,dir=-1,tubeLength=[35,100]);

//[0:bezel width,1:bezel height,2:bezel depth,3:body width,4:body height,5:body depth,6:vPitch,7:bracket height]
module timer(dims = [71.5,71.5,5,66,66,92,100,195,-23],scale=1,port=2,dir=1,tubeLength=[35,100]){
    color("black"){        
        translate([0,0,-dims[5]/2]) cube([dims[3],dims[4],dims[5]],center=true);  //body
        translate([0,0,dims[2]/2]){
            cube([dims[0],dims[0],dims[2]],center=true); //faceplate
        }
            color("darkgray") rotate([0,0,0]) translate([0,0,dims[2]]) cylinder(r1=14,r2=12,h=24);    //knob
        }
        translate([0,0,dims[2]+.1]) scale(0.4) rotate([0,0,0]) dial(scale=scale);
        
        color("white",.2) translate([0,0,6+dims[2]/2]) cube([72,72,12],center=true);
    translate([0,0,-dims[5]-6.35])
    rotate([0,180,0]) valve5_2(port=port,dir=dir,tubeLength=tubeLength);
}

