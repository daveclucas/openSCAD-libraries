

pipe(od=48.2,t=10,l=100,prep="n",spigot=0);
module pipe(od=219.1,t=10.7,l=100,prep="n",spigot=0){
    //prep 0=none, t=top, b= bottom, a= both (all)
    id=od-2*t;
    difference(){
        if (prep=="t"){
            cylinder(d=od,h=l-t);    //prep on top
            translate([0,0,l-t]) weldPrep(od=od,t=t);
        }
        else if (prep=="b"){ 
            translate([0,0,t]) cylinder(d=od,h=l-t);    //prep on bottom
            translate([0,0,t]) rotate([180,0,0]) weldPrep(od=od,t=t);
        }
        else if (prep=="a"){ 
            translate([0,0,t]) cylinder(d=od,h=l-2*t);  //prep on both ends  
            translate([0,0,l-t]) weldPrep(od=od,t=t);
            translate([0,0,t]) rotate([180,0,0]) weldPrep(od=od,t=t);
        }
        else if (prep=="n"){
            cylinder(d=od,h=l); 
        }       
        translate([0,0,-1]) cylinder(d=id,h=l+2*t+2,$fn=8);   //bore
        if(spigot>0)    //create socket in 2nd end
            translate([0,0,l])
            cylinder(h=20,d=od-2*t,$fn=8,center=true);
    }
    if(spigot>0)//place spigot on 1st end
       translate([0,0,l])cylinder(h=20,d=od-2*0.98*t,$fn=8,center=true);
    if(spigot>1)    //create spigot in 2nd end
        cylinder(h=20,d=0.98*od-2*t,$fn=8,center=true);
}
