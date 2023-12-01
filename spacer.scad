use <chamferedCylinder.scad>

spacer(id=10,od=20,t=5);

module spacer(id=3,od=6,t=5){
    difference(){
        chamferedCylinder(h=t,d=od);
        chamferedCylinder(h=t,d=id,hole=true,$fn=20 );
    }
}