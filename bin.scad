use<wireframe.scad>

bin([50,50,50],1);

module bin(size,t){
    difference(){
        union(){
           cube(size+[2*t,2*t,4*t],center=true);
            translate([0,0,0])wireframe(size+[2*t,2*t,2*t],2*t);
        }
       translate([0,0,t+0.1])cube(size+[0,0,2*t],center=true);
    }
}