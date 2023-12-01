use<mirror_copy.scad>
use <cylinderSector.scad>
use<threads.scad>

//rotate([0,90,0])linearBearing(36,26,16);
pillowBlock(cap=true);
//rotate([0,180,0])pillowBlock(cap=false);
module linearBearing(l=36,od=26,id=16){
    difference(od,l,id){
        cylinder(h=l,d=od,center=true);
        cylinder(h=l+2,d=id,center=true);
    }
}

module pillowBlock(l=16,w=60,h=50,cap=true){
    $fn=50;
    difference(){
        union(){
            if(cap)
                translate([0,0,-25])rotate([0,0,-90])
                cylSeg(r=20,l=50,h=6);
            difference(){
                translate([0,-w/2,-h/2])cube([l,w,h]);
                cylinder(h=h+2,d=17,center=true);
                cylinder(h=36.2,d=26.1,center=true);
                mirror_copy([0,1,0])mirror_copy([0,0,1])rotate([0,90,0]){
                    translate([15,(w+26)/4,-1])cylinder(h=l+2,d=6.5,$fn=20);
                    if(cap) //counterbore
                    translate([15,(w+26)/4,l-6])cylinder(h=7,d=10); 
                }
            translate([l-0.9,-25,0])rotate([0,90,0])linear_extrude(1)text("16mm",size=5,halign="center");
            }
        }
        if(cap){    //grease nipple
            #translate([20,0,0])rotate([0,-90,0])
            english_thread (diameter=0.405, threads_per_inch=27, length=3/8, taper=1/16);
        }
    }
}


