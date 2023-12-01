module led(dia=3,color="blue"){
color(color) cylinder(d=dia+.5,h=dia/2,$fn=20);
translate([0,0,1.5])color(color) cylinder(d=dia,h=dia,$fn=20);
translate([0,0,4.5])color(color)sphere(d=dia,$fn=20);
}
