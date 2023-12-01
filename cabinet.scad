//Cabinet Dimensions
//0: width 1: depth, 2:height, 3:thickness,4:left margin,5:right margin,6:top margin,7:bottom margin
cabinet();

module cabinet(w=400,d=240,h=740,t=1.6,lm=15,rm=15,tm=15,bm=15){
    difference(){
        cube([w,d,h]);
        union(){
            //inside
            translate([t,t,t]) cube([w-2*t,d-2*t,h-2*t]);
            //door opening
            translate([lm,-t,bm]) 
            cube([w-lm-rm,2*t,h-tm-bm]);
        }
    }
}
