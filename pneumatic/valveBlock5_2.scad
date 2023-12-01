use <mirror_copy.scad>
use <pneumatic/timerFeed.scad>
use <pu_msl.scad>
use <pipe.scad>
//Parameter 1 (selected port for output (2-NC or 4-NO, port not selected is blanked, port 1 is supply)
//Parameter 2 [0:xOffset,1:port1...etc ] spacings
//Parameter dir si direction of outlet port 1=right (+x), -1=left (0-x)
//tubeLength(input,output)

//valve5_2(port=4,dir=1,tubeLength=[0,0]);
rotate([0,180,0]){
    body();
     translate([0,0,6.35])lid();
}
module body(l=50,l2=42.4, w=25, h=12.7, t=2){
    //body
    difference(){
        union(){
            cube([l,w,h-t],center=true);
            translate([(l+h)/2,0,0])cube([h,42,h-t],center=true);
            translate([(l+h)/2,21,0])cylinder(h=h-t,d=h-t+t,center=true);
        }
        //body cutout
        translate([t,0,t])cube([l,w-2*t,h-t],center=true);
        translate([(l+h)/2,0.5*t,t])cube([(h)-2*t,l2-t,h-t],center=true);
        translate([(l+h)/2,21,1.5*t])cylinder(h=h,d=h-2*t,center=true);
        translate([0,0,-h])cylinder(h=h+t,d=4,$fn=20);
        //ports
        for(i=[0:1]){
            mirror_copy([i*180,0,0])translate([i*12.7,t-w/2,0])rotate([90,0,0])cylinder(h=4,d=5,$fn=20);
        }
        for(i=[0:1]){
            mirror_copy([i*180,0,0])translate([6.35,t+w/2,0])rotate([90,0,0])cylinder(h=4,d=5,$fn=20);
        }
    }
    difference(){
        cube(size=10,center=true);
        translate([0,0,-8])cylinder(h=15,d=4,$fn=20);
    }
}

module lid(l=50, l2=42.4, w=25, h=12.7, t=2){
    //body
    cube([l,w,t],center=true);
    //actuator
    difference(){
        union(){
            translate([(l+h)/2,0,0])cube([h,l2,t],center=true);  
            translate([(l+h)/2,l2/2,-(t)/2])cylinder(h=t,d=h);
        }
        translate([(l+h)/2,(w+h)/2,-t])cylinder(h=4,d=5,$fn=20);   
    }
    for(i=[0:1]){
        mirror_copy([1,0,0])mirror_copy([0,1,0])translate([(t-l)/2+t,(t-w)/2+t,-t/2])cube([t,t,2*t],center=true);
    }
}

module valve5_2(port=2,length=50,ports=[30,0,6.35,12.7,-6.35,-12.7,-6.35],dir=1,tubeLength=[35,35]){
    l=52;w=25.4;h=12.7;
//*****************dimensions*****************
    port0=[
    [31.75,12.7,9.35],
    [0,-12.7,0],
    [6.35,12.7,0],
    [12.7,-6.35,0],
    [-6.35,12.7,0],
    [-12.7,-6.35,0]
    ];
    //***************objects******************
   difference(){
        union(){
            color("Black")
            mirror_copy([0,1,0]) translate([-ports[0],-w/2,-h/2]) 
            cube([l,2,h]);  //valve body long walls
            mirror_copy([1,0,0]) translate([-ports[0],-w/2,-h/2]) 
            cube([2,w,h]);  //valve body short walls
            translate([-ports[0],-w/2,h/2-2]) 
            cube([l,w,2]);  //valve body base
            
            color("Gray"){ 
                translate([22,20,-6.35]) rotate([0,0,-90]) 
                cube([42.35,12.7,12.7]);  //actuator
                translate([28.35,-24,-6.35]) cylinder(h=12.7,d=12.7);
            }
            //port blocks
            for(i=[1:2:5]){
                translate([ports[i],(-w+10)/2,0]) 
                cube([9,10,9],center=true);
            }
            for(i=[2:2:4]){
                translate([ports[i],(w-10)/2,0]) 
                cube([9,10,9],center=true);
            }
        }
     //Ports   
        translate([ports[1],0,0]) rotate([90,0,0]) 
        cylinder(h=15,d=5,$fn=20);  //port 1
        translate([ports[2],16.35,0]) rotate([90,0,0]) 
        cylinder(h=15,d=5,$fn=20);  //port 2
        translate([ports[3],-16.35,0]) rotate([-90,0,0]) 
        cylinder(h=15,d=5,$fn=20);  //port 3
        translate([ports[4],16.35,0]) rotate([90,0,0]) 
        cylinder(h=15,d=5,$fn=20);   //port 4
        translate([ports[5],-16.35,0]) rotate([-90,0,0]) 
        cylinder(h=15,d=5,$fn=20); //port5
        translate([28.35,10,0]) rotate([0,0,90]) 
        cylinder(h=10,d=5,$fn=20); //pilot    
        //mounting hole
        translate([0,0,-10]) cylinder(h=20,d=5,$fn=20);   
        translate([l/2+2,0,-2]) cube([8.7,38,10.7],center=true); 

    
        //***************labels******************
        odds="513";
        evens="42";
        for(i=[0:2]){
        translate([i*12.7-12.7,-9,6])
                linear_extrude(1) text(size=6,odds[i],halign="center",valign="center");;                  
            translate([28.35,10,6.35]) rotate([0,0,90]) 
            cylinder(h=3,d=10,$fn=6); //pilot

        }    
        for(i=[0:1]){
        translate([i*12.7-6.35,9,6])
                linear_extrude(1) text(size=6,evens[i],halign="center",valign="center");      
        }    
        translate([28.35,0,6]) linear_extrude(1) text(size=6,"12",halign="center",valign="center");
    }
}
