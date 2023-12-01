include <boltHead.scad>

knob(diameter=8,lobes=5);
//test piece with 5% shrinkage

module knob(diameter=10,lobes=5){
    assert(lobes>3,"number of lobes must be greater than 3");
    height=diameter;
    pcd=4*diameter;
    lobeDiameter=PI*pcd/2/lobes;
    difference(){
        translate([0,0,diameter/2])union(){
            translate([0,0,diameter/2])cylinder(h=diameter,r2=diameter,r1=(pcd-lobeDiameter)/2,$fn=20); //hub
            difference(){
                cylinder(h=height,d=pcd,$fn=20,center=true);
                for(i=[0:lobes-1])
                    rotate([0,0,180/lobes+i*360/lobes])translate([pcd/2,0,0])
                    cylinder(h=2*height,d=lobeDiameter,$fn=20,center=true);   
            }

            for(i=[0:lobes-1]){ rotate([0,0,i*360/lobes])translate([2*diameter,0,0])
                cylinder(h=height,d=lobeDiameter,$fn=20,center=true);    
            }
        } 
        cylinder(h=3*diameter,d=1.1*diameter,$fn=20);
        translate([0,0,-0.05])    cylinder(h=8,r1=1.065/cos(30)*boltHead(8)/2,r2=1.075/cos(30)*boltHead(8)/2,$fn=6);

    }
}