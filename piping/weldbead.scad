weldbead();
module weldbead(d=219.3,r=10,h=1){
    difference(){
        rotate_extrude()translate([d/2-r+h,0,0])circle(r,$fn=50);
        cylinder(h=r*2+2,d=d,center=true);
    }
}