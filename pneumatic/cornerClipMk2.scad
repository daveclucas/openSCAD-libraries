use <rotate_copy.scad>

cornerClip(4,2,0);

module cornerClip(od=6,n=1,zOffset=0,radius=10){
    diagonal=sqrt(2*pow((od*radius-14),2));
    echo(diagonal);
    for(i=[0:n-1]){
        rotate_copy([0,0,i*90]){ translate([radius*od,0,0]) clip(od,zOffset);
        translate([10*od-9,0,0]) mount();
        }
    }
    for(i=[0:n-2]){
        rotate_copy([0,0,i*90]) translate([(radius*od-10)/2,(radius*od-10)/2,2.5]) rotate([0,0,135]) cube([diagonal,5,5],center=true);
    }    

//    mount();
}

module clip(od,zOffset=10){
    translate([-5,-5,0]) difference(){
        cube([10,10,10+zOffset]);   //body
        translate([5,11,10-od/2+zOffset]) rotate([90,0,0]) cylinder(h=12,d=od,$fn=20);  //clamp
        translate([5-od*.9/2,-1,10-od+zOffset]) cube([od*.9,12,od+2]);   //cutout
    }
}

module mount(){
    difference(){ 
        cylinder(h=10,d=10);
        translate([0,0,-1]) cylinder(h=22,d=4,$fn=20);
        translate([0,0,6]) cylinder(h=22,d=7,$fn=20);
    }
}
