use<BOSL/shapes.scad>

//spring retaining clip for adding to a shape which is placed in a cutout
retainer(width=2.5,depth=1);

module retainer(width=2,height=5,depth=0.75,t=1.5){
    translate([0,1.25*depth,-height]){
        prismoid(size1=[width,depth/2], size2=[width,depth], h=height, shift=[0,depth/4]);
        difference(){
            translate([0,-0.75*depth,0])rotate([0,90,0])cylinder(h=width,d=2*depth,$fn=50,center=true);
            translate([0,-0.75*depth,0])rotate([0,90,0])cylinder(h=width+2,d=depth,$fn=50,center=true);
            translate([-(1+width/2),-1.75*depth,0])cube([width+2,1.5*depth,depth]);
        }
        translate([-width/2,-1.75*depth,0])cube([width,depth/2,height]);
        translate([-width/2,-depth/4,height])cube([width,depth/2,t/2]);
    }
}