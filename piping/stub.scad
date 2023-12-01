use <pipe.scad>
use <nipple.scad>
use <buttWeld.scad>
stub(l=100,threaded=true);
module stub(od=48.3,t=5.05,l=150,rfLength=8,flangeDia=73.2,threaded=false){
    //pipe
    pipe(od=od,t=t,l=l,prep="t");
    difference(){
        //flange
        cylinder(h=rfLength,d=flangeDia);
        //bore
        translate([0,0,-1]) cylinder(h=rfLength+2,r=od/2-t);
    }
    if(threaded){
        translate([0,0,l]) nipple(75,t,od,full=false);
    }
    translate([0,0,l]) buttWeld(od,t,angle=37.5);
}