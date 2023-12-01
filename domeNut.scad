use <knurl.scad>

domeNut();

echo(2*16.7/sqrt(3)*1.02);
module domeNut(od=25,dome=10,h=10,range=10,c2c=16.77*1.02,tNut=8){
    difference(){
        union(){
            knurl(k_cyl_od=od,k_cyl_hg=h,help=true);
            translate([0,0,h])sphere(10,$fn=30);
        }
        cylinder(h=h*1.5,d=11);
        cylinder(h=8,d=2*16.7/sqrt(3)*1.02,$fn=6);
        translate([0,0,h])sphere(5.5,$fn=30);
    }
}
