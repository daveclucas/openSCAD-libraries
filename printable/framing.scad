use<slot.scad>
use<mirror_copy.scad>


stile(w=25,d=25,h=25,t=2,l=508);

module stile(w=75,d=75,h=75,t=2,l=508){
    difference(){
        //endFrameMember(w=l);
        cube([l,d,h]);
//        cheeks(w=w,d=d,h=h);
        //translate([l,0,0])mirror([1,0,0])cheeks();
        //sockets for cross rails
        translate([l-w,-t+0.1,t])
        cube([d-t,d-t,h-2*t]);
        translate([t,-t+0.1,t])
        cube([d-t,d-t,h-2*t]);
    }
}

module rail(w=75,d=75,h=75,t=10,l=1440){
    difference(){
        cube([l,d,h]);
        cheeks(w,d,h,t);
        translate([l,0,0])mirror([1,0,0])cheeks(w,d,h,t);
    }
}

module cheeks(w=75,d=75,h=75,t=10){
    clearance=0.98;
    difference(){
        translate([-(t+1),0,0])cube([w+1,d+1,h+1]);
        translate([0,t,0])cube([w,clearance*d-2*t,clearance*h-t]);
    }
    //translate([0,d2,0])cube([w2,t,h]);
}

module bracket(w=100,d=100,h=100,t=15,dia=25){
    difference(){
        cube([w,d,h],center=true);
        translate([t,0,t])cube([w,d,h],center=true);
        translate([0,0,-h/2])slot(d=dia,h=t*2,l=dia+3);
    }
    mirror_copy([0,1,0])translate([0,w/2-t,0])
    difference(){
        cube([d-2*t,t,h-2*t],center=true);
        translate([d/2,0,h/2])rotate([0,45,0])cube([d,t,h],center=true);
    }
}