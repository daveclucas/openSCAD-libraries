use<mirror_copy.scad>
use<chamferCut.scad>

difference(){
    lug();
    cylinder(d=12,h=10,center=true);
    translate([0,0,-1.5])cylinder(d=22,h=7);
}

module lug(dims=[35,25,9],chamfer=[8,8]){
    difference(){
        cube(dims,center=true);
        mirror_copy([1,0,0])translate([dims.x/2+0.1,dims.y/2+0.1,-(dims.z/2+0.1)])chamferCut([chamfer.x+0.1,chamfer.y+0.1,dims.z+0.2]);
    }
}
