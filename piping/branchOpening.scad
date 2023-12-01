branchOpening(verticalAngle=90,orientation=0);

module branchOpening(
    position=[-219.1/2,0,100],
    shellDiameter=219.1,    
    branchDiameter=60.3,    
    shellLength=500, 
    shellThickness=20, 
    verticalAngle=90, 
    verticalPosition=100,   
    sides=8,
    orientation=0
){
    rotate([0,0,180+orientation])
    difference(){
        intersection(){
            cylinder(h=shellLength,d=shellDiameter+2);
            translate(position)rotate([0,verticalAngle,0])
            cylinder(h=shellDiameter,d=branchDiameter,center=true,$fn=sides);
        }
        cylinder(h=shellLength,d=shellDiameter-2*shellThickness,$fn=sides);    
    }
}