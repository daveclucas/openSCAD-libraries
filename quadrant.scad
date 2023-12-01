/*
Author: Dave Clucas 2021 Version 0.2
Create a quadrant shaped pillar for supporting an enclosure lid
*/
//Example
quadrant(w=10,r=0,h=12,fn=50, brim=0);


module quadrant(w=8, r=0,h=10, fn = 50, brim=0 ) {
    if (brim>0){
        translate([0,0,h]){
            difference(){
                cube([w,w,brim]);
                translate([2,2,0])
                cube([w,w,brim+0.1]);
            }
        }
    }

	intersection(){
		cube([w+r,w+r,h]);
		union(){
 			cylinder(h,w,w,$fn=fn);
				rotate_extrude(angle=360,convexity=10,$fn=fn){
				translate([w,0,0])
				difference(){   //fillet shape
					square(r);
					translate([r,r,0])
					circle(r,$fn=fn);
				}
			}
		}
	}
}
