blindFlange();
module blindFlange(od=155,t=20.7,rfLength=1.6,rfDia=73.2,hole=20,pcd=114.3,n=4){
    difference(){
        union(){
            //raised face
            cylinder(h=rfLength,d=rfDia);
            //flange
            translate([0,0,rfLength]) cylinder(h=t,d=od);
            }
        //holes
        for(i=[1:n]){
            rotate([0,0,i*360/n+360/(n*2)]) translate([pcd/2,0,0]) cylinder(h=t+2,d=hole);
        }
    }
}