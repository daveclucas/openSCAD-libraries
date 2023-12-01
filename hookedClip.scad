


il=64;  //internal length
oal=70;w=4.5;t=2.7;
lip=[3,2];  //length,ip
hook=[3,3.5,2];   //length, width, lip
taper=[19,2];   //length, root

//cube([oal-taper.x-hook.x,w,t]); //parallel section
//cube([lip.x,w+lip.y,t]);    //lip
//taper and hook section
translate([il+lip.x+hook.x-taper.y/2,taper.y/2+w-taper.y/2,0])cylinder(h=t,d=taper.y,$fn=20);
path=[[0,0],
[taper.x+hook.x-taper.y/2,w-taper.y],
[taper.x+hook.x-taper.y/2,w],
[taper.x-taper.y/2+1,w+hook.y/2],
[taper.x-taper.y/2,w+hook.y/2],
[taper.x-taper.y/2,w],
[0,w]
];
path2=[
[0,0],
[0,w+lip.y],
[lip.x,w+lip.y],
[lip.x,w],
[lip.x+il,w],
[lip.x+il,w+lip.y],
[lip.x+il+1,w+lip.y],
[lip.x+il+1+taper.y/1.5,w+taper.y/2],
[lip.x+il+1+taper.y/2,w-taper.y/2],
[lip.x+il+1+taper.y/2-taper.x,0]
];
linear_extrude(t)polygon(path2);