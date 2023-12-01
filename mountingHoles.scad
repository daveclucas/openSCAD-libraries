mountingHoles(10,30,100,20,10,20);
module mountingHoles(dia=3,depth=10,xCtrs=50,yCtrs=25,xOffset=0,yOffset=0){
    for (i=[-1:2:1],j=[-1:2:1]){
        translate([xOffset+i*xCtrs/2,yOffset+j*yCtrs/2,-0.001]) cylinder(d=dia,h=depth+0.002,$fn=20);
    }  
}
