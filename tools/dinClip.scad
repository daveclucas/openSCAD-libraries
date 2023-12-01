use<mirror_copy.scad>
use<BOSL/shapes.scad>

din=[35,7.5,1000,4,1.2];
dinRailClip(lever=true);

module dinRailClip(width=10,length=10,height=40,thickness=1.2,lever=false){
    chamfer=[4,1];
    difference(){
        translate([thickness,0,-20])cube([width,length,height]);    //body
        scale(1.01)translate([0,-1,0])dinRail();   //DIN rail scaled for clearance
        x=thickness;y=12.3;y2=35/2-1;   //coordinates for chamfers
        mirror_copy([0,0,1])
        translate([0,length+1,0])
        rotate([90,0,0])linear_extrude(length+2)polygon([
            [x,y-chamfer[1]],
            [x+chamfer[0],y],
            [x+7.5-thickness,y],
            [x+7.5-thickness,y2],
            [x+chamfer[0],y2],
            [x,y2+chamfer[1]],
        ]);  //chamfers
        //hinge
        translate([8.5,-1,-12])rotate([-90,0,0])cylinder(h=length+2,d=3,$fn=20);
        //mounting hole
        translate([0,5,5])rotate([00,90,0]){
            cylinder(h=20,d=3.5,$fn=20);
            cylinder(h=5,d=6,$fn=20);
        }
    }
    if(lever){
        //add a release lever
        translate([width/2+thickness,length/2,-(15+height/2)])rotate([90,0,0]){
            cylinder(h=length,d=3,$fn=20,center=true);
            translate([0,length/2+3,0])cube([3,15,length],center=true);
        }
    }
}

module dinRail(height=35,width=7.5,length=1000,flangeLength=4,thickness=1.2){
    difference(){
        union(){
            translate([0,0,flangeLength-height/2])cube([width-thickness,length,height-2*flangeLength]);
            translate([width-thickness,0,-height/2])cube([thickness,length,height]);
        }   //body
        translate([thickness,-1,flangeLength+thickness-height/2])
        cube([width,length+2,height-2*(flangeLength+thickness)]);   //din rail shape
    }
}


