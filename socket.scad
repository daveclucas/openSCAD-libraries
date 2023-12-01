module socket(pins){
    for (i=[0:pins-1])
    translate([2.5+i*2.5,3,3]) cylinder(6,d=1,center=true,$fn=20);
    difference(){
        color("White") cube([(pins+1)*2.5,6,7]);
        translate([.5,.5,1]) cube([1.5+pins*2.5,5,7]);
    }
}
