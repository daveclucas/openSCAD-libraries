$fn=50;
Dia=10;
height=2;

boss(Dia,height);

module boss(d,h){
    path=[[0,0],[0,height],[2*height,0]];
    rotate_extrude()translate([Dia/2,0,0])polygon(path);
    cylinder(d=Dia,h=height);
}