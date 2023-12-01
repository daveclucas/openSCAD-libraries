use<tools/dinClip.scad>
cableRail();

module cableRail(w=4,d=8,t=3,l=30,n=20){
    for(i=[0:n-1]){
        translate([i*3*w,0,0])
        difference(){
            cube([3*w,l,t],center=true);
            translate([0,l/2-d,0])cylinder(h=2*t,d=d,center=true);
            translate([0,-d,0])cube([w,l,10],center=true);
        }
        difference(){
            translate([i*3*w,(l+w)/2,(w-l)/2])
            cube([3*w,w,l],center=true);  //vertical stiffener
            translate([0,0,-l/2])rotate([90,0,0])
                cylinder(h=2*l,d=4,center=true,$fn=20);
            translate([(n-1)*3*w,0,-l/2])rotate([90,0,0])
                cylinder(h=2*l,d=4,center=true,$fn=20);
        }
    }
}