barrelSocketMount();
module barrelSocketMount(x=0,y=0,z=0,diameter=9.5,height=15,thickness=3.2){
    translate([x-2*thickness,y,z])  //align front with y axis and apply offsets
    difference(){
        translate([thickness+.1,0,0])
        cube([thickness*2,diameter*2,height],center=true);  //cutout to top
        union(){   //adaptor shape
            translate([0,-(diameter/2+.1),0])    //move cube to centreline
            cube([2*thickness+.2,diameter,diameter]);
            rotate([0,90,0])                // rotate vertical
            cylinder(d=diameter,h=2*thickness+.2,$fn=20);
            cube([thickness+.2*2,diameter,diameter],center=true);
        }
    }
}
