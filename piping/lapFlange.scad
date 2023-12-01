use <piping/stub.scad>
use <piping/nipple.scad>

lapFlange();

module lapFlange(od=155,id=49,t=20.7,rfLength=8,hubDia=70,flangeLength=32,hole=20,l=75,halfNipple=true){
        difference(){
            translate([0,0,rfLength])
            union(){
                //flange
                cylinder(h=t,d=od);
                //hub
                cylinder(h=flangeLength,d=hubDia);
            }
            //bore
            translate([0,0,-1]) cylinder(h=flangeLength+2,d=id);
            //holes
            for (i=[0:3]){
                rotate([0,0,45+i*90]) translate([114.3/2,0,-1]) cylinder(h=t+2,d=hole);
            }
        }
 
        if (halfNipple){
            translate([0,0,l]) nipple(full=false);
        }
        stub(l=l,rfLength=8);
}