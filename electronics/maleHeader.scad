module maleHeader(pins=40,pinLength=11.2,rotation=0){
    length=2.5 * pins;
    color("Black") cube([length,2.5,2.5]);  //plastic base
    for (i=[0:pins-1]){ //pins
        translate([1.25+2.5*i,1.25,2.5]) color("white") cylinder(r=0.5,h=pinLength,center=true,$fn=20);
    }
}
maleHeader(pins=5,pinLength=7);