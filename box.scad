use<mirror_copy.scad>

//***************** global variables *****************
gT=1.5; //global thickness
gSize=[240,200,40];
insertHoleDia=4.2;
gFillet=8;
//****************************************************
assert(gFillet>=insertHoleDia+2*gT,concat("Minimum fillet radius is ",str(insertHoleDia+2*gT)));


//Example:
boxBase();
translate([0,0,100])boxLid(size=gSize-[0,0,30]);

module boxBase(size=gSize,fillet=gFillet,t=gT){
    box(size,fillet);
    pillars(size,r=fillet-t,t=-t);
}

module boxLid(size=gSize,t=gT,fillet=gFillet,screwHole=4){
    mirror([0,0,1])
    difference(){
        union(){
            box(size,fillet);
            translate([0,0,t])
            box(size-[2*t,2*t,0],fillet=fillet-t);  //create loction rim
            pillars(size,r=fillet-t,t=t);
        }
        //holes
        mirror_copy([0,1,0])mirror_copy([1,0,0]) //copy to all corners
        translate([size.x/2-fillet,size.y/2-fillet,0]){
            cylinder(h=2*size.z,d=4,center=true,$fn=20);
            translate([0,0,-(size.z+t)/2])
            cylinder(h=4,r1=screwHole/2,r2=3*screwHole/2,$fn=20);
        }
    }
}

module pillar(h,r,t){
    difference(){
        cylinder(h=h,r=r,$fn=20,center=true);
        cylinder(h=h,d=insertHoleDia,$fn=20,center=true);
    }
}

module pillars(size,r,t=gT,fillet=gFillet){
    height=(t>0)?size.z+t:size.z+2*t;
    //add corner pillars
    mirror_copy([0,1,0])mirror_copy([1,0,0]) //copy to all corners
    translate([size.x/2-fillet,size.y/2-fillet,(height-size.z)/2])
    pillar(h=height,r=fillet-gT,t=t);echo(height,r,t);
}

module box(size=gSize,fillet=gFillet){
    //box
    difference(){
        hull(){
            mirror_copy([0,1,0])mirror_copy([1,0,0]) //copy to all corners
            translate([size.x/2-fillet,size.y/2-fillet,0])
            cylinder(h=size.z,r=fillet,center=true,$fn=30);
        }
        translate([0,0,gT])
        hull(){
            mirror_copy([0,1,0])mirror_copy([1,0,0]) //copy to all corners
            translate([size.x/2-fillet,size.y/2-fillet,0])
            cylinder(h=size.z,r=fillet-gT,center=true,$fn=30);
        }
    }
 }

module rim(size=gSize,t=gT){
        //add a rim
        translate([0,0,t/2])boxBase(size-[2*t,2*t,-t]);
}
