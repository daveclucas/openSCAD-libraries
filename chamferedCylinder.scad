chamferedCylinder(10,10,0.3,true);

module chamferedCylinder(h=1,d=1,chamfer=0.3,hole=false){
    //cylinder(h=h,d=d,$fn=20);
    if(hole){
        path=[[0,-0.1],[d/2+chamfer,-0.1],[d/2+chamfer,0],[d/2,chamfer],[d/2,h-chamfer],[d/2+chamfer,h],[d/2+chamfer,h+0.1],[0,h+0.1]];
    rotate_extrude() polygon(path);
        }
    else{
        path=[[0,0],[d/2-chamfer,0],[d/2,chamfer],[d/2,h-chamfer],[d/2-chamfer,h],[0,h]];
    rotate_extrude() polygon(path);
         }
}