//saddle.scad
//creates a saddle based on shell and branch dimensions
//parameters:D = shell od, d = branch od, t = branch thickness, 
//a = angle of fillet along z axis, b = angle of fillet alang x axis
//==================================================================

//Example: saddle(D=168.3,d=60.3,t=4,a=30,b=15,f=5);
//saddle();

module saddle(D=168.3,d=60.3,t=4,a=30,b=15,f=5){
    
    l=D/2;  echo(l);
    m=d+2*sin(a)*l;echo(m);
    M=d+2*sin(b)*l;echo(M);

    difference(){
            translate([0,0,-f])hull(){
                cylinder(h=0.1,d=d);
                translate([0,0,l])scale([1,M/m,1])cylinder(h=0.1,d=m);
            }
            translate([0,0,D/2])
       rotate([90,0,0])cylinder(h=M+2,d=D,center=true);    //subtract shell
        cylinder(h=d+f,d=d-2*t,center=true);    //pipe bore
    }
}

branch();

module branch(d=60.3,l=100,t=4,saddle=true){
    difference(){
        cylinder(h=l,d=d);
        translate([0,0,-1])cylinder(h=l+2,d=d-2*t);
    }
    if(saddle)rotate([180,0,0])saddle();
}