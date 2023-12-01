module M3insert(){
    $fn=50;
    difference(){
        union(){
            sphere(4);
            cylinder(d=8,h=12);
        }
        sphere(2.1);
        cylinder(d=4.2,h=12.1);
    }
}