use <pcbPost.scad>
module pcbHolder(l=70,w=50){
    difference(){
        translate([0,0,4]) cube([8,l,8],center=true);
        for (i=[-1:2:1]){  //mounting holes
            translate([0,i*(l/2-12),4]) cylinder(r=2,h=10,center=true,$fn=20);
        }
    }
    for (i=[0:1]){  //pcb posts
        rotate([0,0,i*180]) translate([0,-l/2,0]) pcbPost(h=w);
    }
}
