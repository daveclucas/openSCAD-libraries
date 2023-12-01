use<mirror_copy.scad>

//function to ensure a minimum wall thickness
function maxId(od,scale=1,t=1.5)=od-2*max(t/scale,od*0.05*scale);
scale=1;t=1.5;

//Example:
spigotPipe(scale=1/7,length=100,style=1);

module spigotPipe(scale=1,od=60.3,clearance=0.98,length=200,t=1.5,style=0){
    difference(){
        cylinder(h=length,d=od*clearance,center=true,$fn=20);
        cylinder(h=length+2,d=maxId(od,scale,t),center=true,$fn=8);
    }
    if(style>0)
        if(style==2)mirror_copy([0,0,1]){
            translate([0,0,length/2])
            spigot(scale-scale,diameter=od,clearance=clearance,length=10);
        }
        else{
            translate([0,0,length/2])
            spigot(scale=scale,diameter=od,clearance=clearance,length=10);
        }
}

module spigot(scale,diameter=60.3,clearance=0.98,length=14,spigotRatio=0.9){
    l=diameter/2;
    od=maxId(diameter,scale,t) ;
    id=maxId(od,scale,t);
    translate([0,0,-3*l/4])
    difference(){
        union(){
            cylinder(h=l,d=od*clearance,$fn=8);
            cylinder(h=3*l/4,d=od,$fn=8);
        }
        cylinder(h=l+0.1,d=id,$fn=8);
        cylinder(h=3*l/4,r1=od/2*clearance,r2=id/2,$fn=8);
    }
}
