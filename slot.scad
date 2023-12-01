use <mirror_copy.scad>
slot(d=6.5,l=1,h=10,centre=false);

module slot(d=10,l=50,h=10,help=false,centre=true){
    if(help)echo("slot(d=10,l=50,h=10)");
    mirror_copy([1,0,0]) translate([-l/2,0,-0.1]) cylinder(h=h+0.2,d=d,$fn=40,center=centre);
    if(centre)
        cube([l,d,h],center=centre);
    else
        translate([0,-d/2,0])cube([l,d,h],center=centre);
}
 