module connectorBlock(n=2,color="green"){
    difference(){
        color(color) cube([n*5,9,12.7]);
        for (i=[0:n-1]){
            color("white") translate([2.5+i*5,2.8,11]) cylinder(d=4,h=2,$fn=20);
            color("grey") rotate([90,0,0]) translate([2.5+i*5,2.8,-2.4]) cylinder(d=2.5,h=2,$fn=20);
            color("white") translate([0.5+i*5,-0.001,1]) cube([4,1,6.5]);
        }
    }
}
connectorBlock(n=5,color="green");