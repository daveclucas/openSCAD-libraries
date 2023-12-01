use<dowel.scad>

//uses dowel.scad to create a socket in end end of the elbow and a spigot on the other end of the elbow

//module elbow(od,id,radius)
//Example
scale(1/7)elbow(48.3,35);

 module elbow(od=48.3, id=35, radius=63.5) {
    l=20;  //length of dowel
    // bend
    difference() {
        // create torus
        rotate_extrude(angle=90) 
        translate([radius, 0, 0]) circle(r=od/2);
        //create socket
        translate([radius,l/2,0])rotate([0,90,90])
        dowel(d=id,l=l,chamfer=-3.5);
    }
    //create spigot
    translate([3.5-l/2,radius,0])rotate([0,90,0])
    dowel(d=id-3.5,l=l,chamfer=3.5);
}