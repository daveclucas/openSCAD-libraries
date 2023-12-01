use <threads.scad>

coupling(full=true);
module coupling(od=63.5,l=80,full=false){
    if(full) mirror([0,0,1]) halfCoupling(od,l);
    halfCoupling(od,l);
}
module halfCoupling(od,l){
    difference(){
        translate([0,0,.1]) cylinder(h=l/2-.2,d=od);
          mirror([0,0,1]) translate([0,0,-l/2]) english_thread (diameter=48.3/25.4, threads_per_inch=14, length=1, taper=1/16);
        cylinder(l/2+2-25.4,d=48.3);
    }
}