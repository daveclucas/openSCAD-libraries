use <maleHeader.scad>

module oledDisplay(xCtrs=33.6,yCtrs=41.2){
    translate([0,0,-5.5]){    //  set origin
        translate([0,2.75,5.5]) color("grey") cube([36.5,26,0.2],center=true); //view area
        translate([0,0,3.25]) color("white") cube([40,34,4.5],center=true);  //screen
        difference(){
            translate([0,-0.7,0.5]) color("SteelBlue") cube([42.7,45.6,1],center=true);    //pcb
            for (i=[-1:2:1],j=[-1:2:1]){
              translate([i*xCtrs/2,j*yCtrs/2,-.2]) cylinder(r=1.5,h=2,$fn=20);  
            }
        }
        translate([-4*2.5+1.25,-20]) rotate([180,0,0]) maleHeader(pins=8);
    }
}


oledDisplay();

