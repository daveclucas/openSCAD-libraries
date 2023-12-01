use <rotate_copy.scad>

l=200;
n=7;
t=3;
w=20;

truss(l,w,n,t);

module truss(l,w,n,t,chamfer=true){
    pitch=(l-2.5*t)/n;
    Lo=pitch+t/2;
    Li=Lo-t;
    Wi=w-2*t;
    translate([t+Lo/2,0,0]){
        for (i=[0:n-1]){   
            translate([i*pitch,0,0]) 
            rotate([0,i*180,0])  
            translate([-Lo/2,0,-t/2]){
                difference(){
                    cube([Lo,w,t]);
                linear_extrude(2*t) polygon([[t,1.5*t],[Li-.5*t,Wi+t],[t,Wi+t]]);
                linear_extrude(2*t) polygon([[1.5*t,t],[Li,t],[Li,Wi+0.5*t]]);
                }
            }
        }
        //Add corner posts
        translate([-(Lo+t)/2,w/2,0]) cube([t,w,t],center=true);
        translate([l-(1.5*t+Lo/2),w/2,0]) cube([t,w,t],center=true);
    }
}