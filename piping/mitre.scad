mitre();
module mitre(od=60.3,angle=45,t=14,spigot=false){
    spigotDia=od-2*t;
    id=od-2*t;
    height=sin(angle)/cos(angle)*od;
    //translate([0,0,-x/cos(angle)/2])
    difference(){
        cylinder(h=height,d=od,center=true);
        rotate([0,-angle,0])cylinder(h=height/2,d=id,$fn=8,center=true);
        translate([-od/2,-od/2,-height/2])
        rotate([0,-angle,0])
        cube([od/cos(angle),od,od]);
    }
    if(spigot)
        rotate([0,-angle,0])
        cylinder(h=t,d=id,$fn=8,center=true);   
}  
