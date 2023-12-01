use <mirror_copy.scad>
threadolet();

module threadolet(l=27,r1=19,r2=13,id=21,od=48.3){
    difference(){
//        mirror_copy([0,0,1]) 
        translate([0,0,-0.5*l]) cylinder(h=l*1.5,r1=r1,r2=r2);
        translate([0,0,-l*.6]) cylinder(h=l*2,d=id);
        translate([-r1,0,-od/2]) rotate([0,90,0]) cylinder(h=r1*4,d=od);
    }
}