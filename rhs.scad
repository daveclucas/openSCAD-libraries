// module to model rolled hollow section with square or mitred ends
rhs(l=200,w=75,h=75,t=8,spigot=true);
module rhs(l=500,w=50,h=100,t=3,mitred=false,spigot=false){
    difference(){
    cube(size=[l,w,h]);
        if(mitred){
            rotate([0,-45,0]) cube([l+2,w+2,h+2]);
            translate([l,w,0]) rotate([0,-45,180]) cube([l,w,h]);
        }       
        translate([0,t,t]) cube([l+2,w-2*t,h-2*t]);
    }
    if(spigot)translate([0,w/2,h/2])rotate([0,-90,0])spigot(h,w,t);
}

module spigot(l,w,t){
    height=3*t;
    difference(){
        cube([l-2*t,w-2*t,2*height],center=true);
        hull(){
            translate([0,0,-0.05])cube([l-4*t,w-4*t,0.1],center=true);
            translate([0,0,-height])cube([l-2*t,w-2*t,0.1],center=true);
        }
        cube([l-4*t,w-4*t,2*height],center=true);

    }
}
