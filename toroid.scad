toroid();

module toroid(r=5,R=20,angle=45){
    rotate_extrude(angle=angle)translate([R,0,0])circle(r,$fn=30);    
}