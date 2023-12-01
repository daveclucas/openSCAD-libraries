
cSection(100,50,1.6,500);

module cSection(w=100,d=50,t,l=200){
    difference(){
        cube([w,d,l],center=true);
        cube([w-2*t,d-2*t,l+2],center=true);
        translate([0,-d/2,0])cube([w/2,t+2,l+2],center=true);
    }
}