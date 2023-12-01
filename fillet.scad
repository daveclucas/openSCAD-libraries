circularFillet();

module fillet(f){
	difference(){   //fillet shape
		square(f);
		translate([f,f,0])
		circle(f,$fn=20);
	}
}

module circularFillet(d=50,r=5,concave=false){
    if(concave){
        difference(){
            rotate_extrude()translate([d/2-r ,0,0])circle(r=r,$fn=20);
            translate([-d,-d,0])cube([2*d-r,2*d-r,2*r]);
            cylinder(h=2*r,d=d-r,center=true);
        }
    }
    else{
        difference(){
            translate([0,0,-r])cylinder(h=r,d=d+2*r);  //outer edge
            rotate_extrude()translate([d/2 ,0,0])circle(r=r,$fn=50);
            //cylinder(h=2*r,d=d,$fn=50,center=true); //inner edge
            cylinder(h=2*r,d=d-2*r,center=true);
        }
    }
} 