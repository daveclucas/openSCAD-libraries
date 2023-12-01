use <mirror_copy.scad>
use <pipe.scad>
pu(1,4);

//d, od, l/2
dims=[
[4,10.4,16.25],[6,12.8,17.25]
];

module pu(index=1,ways=1,tube=[0,0,0,0]){
    puBranch(index,tube[0]);
    if(ways>=2&&ways<5) mirror([0,0,1]) puBranch(i=index,l=tube[1]);
    if(ways==3||ways==4) rotate([-90,0,0]) puBranch(i=index,l=tube[2]);
    if(ways==4) rotate([90,0,0]) puBranch(i=index,l=tube[3]);
    if(ways==90){ rotate([-90,0,0]) puBranch(i=index,l=tube[1]);
        rotate([0,90,0])    translate([0,0,-dims[index][1]/2]) cylinder(h=dims[index][1],d=dims[index][1]);
    }
}

module puBranch(i=1,l=0){
    //d, od, l/2
    dims=[
    [4,10.4,16.25],[6,12.8,17.25]
    ];
    od=dims[i][1];
    height=dims[i][2];
    dia=dims[i][0];
    difference(){
        union(){
            translate([-od/2,-od/2,0]) 
            cube(size=od);   //body
            cylinder(h=height,d=od,$fn=20); //branch
        }
        translate([0,0,-1]) cylinder(h=height+2,d=dia,$fn=20);
    }
    pipe(od=dia,t=1,l=l);
}
