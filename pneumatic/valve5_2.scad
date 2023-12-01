use <pneumatic/timerFeed.scad>
use <pu_msl.scad>
use <pipe.scad>
//Parameter 1 (selected port for output (2-NC or 4-NO, port not selected is blanked, port 1 is supply)
//Parameter 2 [0:xOffset,1:port1...etc ] spacings
//Parameter dir si direction of outlet port 1=right (+x), -1=left (0-x)
//tubeLength(input,output)

valve5_2(port=4,dir=1,tubeLength=[35,100]);
module valve5_2(port=2,length=50,ports=[30,0,6.35,12.7,-6.35,-12.7,-6.35],dir=1,tubeLength=[35,35]){

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
            color("Black")translate([-ports[0],-12.7,-6.35]) cube([52,25.4,12.7]);  //valve body
            color("Gray"){ 
                translate([22,20,-6.35]) rotate([0,0,-90]) 
                cube([42.35,12.7,12.7]);  //actuator
                translate([28.35,-24,-6.35]) cylinder(h=12.7,d=12.7);
                }
            translate([28.35,10,6.35]) rotate([0,0,90]) cylinder(h=3,d=10,$fn=6); //pilot
        }
     //Ports   
            translate([ports[1],-16.35,0]) rotate([90,0,0]) 
        cylinder(h=10,d=5,$fn=20);  //port 1
            translate([ports[2],16.35,0]) rotate([90,0,0]) 
        cylinder(h=10,d=5,$fn=20);  //port 2
            translate([ports[3],-16.35,0]) rotate([-90,0,0]) 
        cylinder(h=10,d=5,$fn=20);  //port 3
            translate([ports[4],16.35,0]) rotate([90,0,0]) 
        cylinder(h=10,d=5,$fn=20);   //port 4
            translate([ports[5],-16.35,0]) rotate([-90,0,0]) 
        cylinder(h=10,d=5,$fn=20); //port5
                     translate([28.35,10,0]) rotate([0,0,90]) 
        cylinder(h=10,d=5,$fn=20); //pilot        
    }
    
    //***************labels******************
    odds="513";
    evens="42";
    for(i=[0:2]){
    translate([i*12.7-12.7,-9,6])
            linear_extrude(1) text(size=6,odds[i],halign="center",valign="center");;      
    }    
    for(i=[0:1]){
    translate([i*12.7-6.35,9,6])
            linear_extrude(1) text(size=6,evens[i],halign="center",valign="center");      
    }    
    translate([28.35,0,6]) linear_extrude(1) text(size=6,"12",halign="center",valign="center");
    //***************ports******************
    //translate(port0[1])
    translate([0,-12.7,0]) rotate([180,-90,0]) pu_msl(1,5,tubeLength[0]);    //air inlet port 1
    // Outlet port
    if (port==2){ 
        translate([6.35,12.7,0]) mirror([dir+1,0,0]) pu_msl(1,5,tubeLength[1]);
        translate([-6.35,12.7,0]) rotate([-90,0,0]) cylinder(h=3,d=8,$fn=6);
    }
    if (port==4){ translate([-6.35,12.7,0]) mirror([dir+1,0,0]) pu_msl(1,5,tubeLength[1]);
        translate([6.35,12.7,0]) rotate([-90,0,0]) cylinder(h=3,d=8,$fn=6);
    }
}
