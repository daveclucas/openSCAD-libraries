use<bezel.scad>

microPushButton();
translate([0,0,3.75/2])bezel(6,3.5,4,shrinkage=[.25,.25,.25]);


module microPushButton(size=[6,3.5,4],center=true){
    translation=(center) ? [-size.x/2,-size.y/2,0] : [0,0,0];   
    translate(translation){
        cube(size);
        translate([1.5,1,4])cube([3,1.5,1.5]);
    }
}
