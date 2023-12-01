use <piping/pipe.scad>
use <threads.scad>

nipple(full=false);

module nipple(l=75,t=5.05,od=48.3,full=true){
    if (full){
        mirror([0,0,1]) halfNipple(l,t,od);
    }
    halfNipple();
}
module halfNipple(l=75,t=5.05,od=48.3){
    pipe(od,t,l=l-25.4);
        translate([0,0,l/2]){
        difference(){
            english_thread (diameter=48.3/25.4, threads_per_inch=14, length=1, taper=1/16);
            cylinder(h=l,r=od/2-t);
        }
    }
}
