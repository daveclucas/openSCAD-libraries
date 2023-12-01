
include <ASA150.scad>
use<piping/spigotPipe.scad>

scale(1/7)rfwn(ASA150[4],wall=10,rf=0,spigot=true);
echo(ASA150[4]);

module rfwn(dims,wall=3.68,rf=1.6,spigot=false,nuts=true){
    difference(){
        union(){
            //raised face
            cylinder(h=rf,d=dims[3]);
            //flange
            translate([0,0,rf]) cylinder(h=dims[4],d=dims[1]);
            //hub;
            translate([0,0,rf+dims[4]]) 
            cylinder(h=dims[6]-(rf+dims[4]+wall),r1=dims[2]/2,r2=dims[7]/2);
            //#translate([0,0,dims[6]-t]) cylinder(h=wall,d=dims[7]);
                translate([0,0,dims[6]-wall])cylinder(h=5,d=dims[7]);
            if(spigot){
                //add a spigot same length as flange + wall  
                cylinder(d=dims[7]-2*wall,h=dims[6]+wall,$fn=8);
             if(nuts){
                for(i=[1:dims[9]]){
                    //bolt holes - add half rotation to straddle c/l
                    rotate([0,0,i*360/dims[9]+180/dims[9]]) 
                    translate([dims[8]/2,0,dims[4]]){
                        cylinder(h=dims[10],d=1.5*dims[10],$fn=6);
                        cylinder(h=1.25*dims[10],d=dims[10],$fn=20);
                    }
                }
            }
          }
       }
       //bore
       if(spigot){
            translate([0,0,wall]) cylinder(h=dims[6]+wall+0.1,r1=dims[7]/2-wall,r2=dims[7]/2-2*wall,$fn=8);
           translate([0,0,-0.1]) cylinder(h=dims[6]+wall+0.1,d=0.97*dims[7]-2*wall,$fn=8);

       }
       else
           translate([0,0,-dims[7]]) cylinder(h=dims[6]*2,d=dims[7]-2*wall,$fn=8);
       if(!nuts)
        for(i=[1:dims[9]]){//bolt holes - add half rotation to straddle c/l
                rotate([0,0,i*360/dims[9]+180/dims[9]]) translate([dims[8]/2,0,0]) cylinder(h=dims[4]+2,d=dims[10],$fn=20);
        }
    }
}

module rfblind(dims,rf=1.6){
    difference(){
        union(){
            //raised face
            cylinder(h=rf,d=dims[3]);
            //flange
            translate([0,0,rf]) cylinder(h=dims[4],d=dims[1]);
        }
        for(i=[1:dims[10]]){
            rotate([0,0,i*360/dims[10]+360/(dims[10]*2)]) translate([dims[8]/2,0,0]) cylinder(h=dims[4]+2,d=dims[9]);
        }
    }
}