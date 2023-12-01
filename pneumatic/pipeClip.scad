use <mirror_copy.scad>

// set step to true if creating clamps ie. opposing pairs
// male and female location pillars will be automatically created

pipeClip(dia=6,n=1,step=true);

module pipeClip(dia=6,n=1,base=3,step=true){
    width=dia+4;
    depth=dia+4;
    hole=4; //screw hole
    height=dia/2+base;
    translate([-n/2*width+width/2,0,0])
    for(i=[0:n-1]){
        translate([i*width,0,0])
        difference(){
            translate([0,0,-height/2]) 
            cube([width,depth,height],center=true);
            translate([0,1+depth/2,0]) rotate([90,0,0])
            cylinder(h=depth+2,d=dia,$fn=20);
            mirror_copy([1,0,0]) translate([-(2+dia/2)-0.1,-depth/2-1,-dia/2]) 
            cube([1,depth+2,dia]);  //relief grooves
        }
    }
    mirror_copy([1,0,0])
    translate([-width,0,-height/2])
        difference(){
            cube([width,depth,height],center=true);
            translate([0,0,-height/2-1]) cylinder(h=height+2,d=hole,$fn=20);
        }
}

