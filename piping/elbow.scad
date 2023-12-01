use <rotate_copy.scad>
//example of plain 1 1/2" elbow
scale(1/7)elbow(od=48.3, t=10, radius=63.5,spigot=0);
//example of 1 1/2" threaded elbow
//translate([100,0,0])
//elbow(od=48.3,t=3.68, radius=57.1,spigot=0);

 module elbow(od=48.3, t=3.68, radius=57.1,flangeDia=0,flangeLength=0,offset=0,spigot=0) {
     translate([-radius,0,0]){
        // bend
        difference() {
            // torus
            if(flangeDia>0)
                rotate_extrude(angle=90) translate([radius, 0, 0]) circle(r=flangeDia/2-offset);
            else         
                rotate_extrude(angle=90) translate([radius, 0, 0]) circle(r=od/2);
            
            rotate_extrude(angle=90) translate([radius, 0, 0]) circle(r=od/2-t,$fn=8);
            if(spigot>0)    //create socket in 2nd end
                translate([0,radius,0])rotate([90,0,90])
                cylinder(h=20,d=od-2*t,$fn=8,center=true);
        }
        //flange
        translate([radius,0,0]) rotate([-90,0,0]) difference(){
            cylinder(h=flangeLength,d=flangeDia);
            translate([0,0,-1]) cylinder(h=flangeLength+2,d=od-t*2);
        }
        translate([0,radius,0]) rotate([0,90,0]) difference(){
            cylinder(h=flangeLength,d=flangeDia);
            translate([0,0,-1]) cylinder(h=flangeLength+2,d=od-t*2);
        }
    }
    if(spigot>0)//place spigot on 1st end
        rotate([90,0,0])cylinder(h=20,d=od-2*0.98*t,$fn=8,center=true);
    if(spigot>1)    //create spigot in 2nd end
        translate([-radius,radius,0])rotate([90,0,90])
        cylinder(h=20,d=0.98*od-2*t,$fn=8,center=true);
}