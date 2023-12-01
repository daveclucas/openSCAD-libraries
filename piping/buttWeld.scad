use <mirror_copy.scad>
buttWeld();
module buttWeld(od=48.3,t=5.05,rootGap=3,rootFace=1.6,angle=37.5){
    p0=[0,0];
    p1=[0,rootGap/2];
    p2=[rootFace,rootGap/2];
    p3=[t,rootGap/2+tan(angle)*(t-rootFace)];
    p4=[t*1.1,0];
    rotate_extrude() translate([od/2-t,0,0]) //move to od and extrude
    mirror_copy([0,1,0]) polygon([p0,p1,p2,p3,p4]);  //weld profile
}