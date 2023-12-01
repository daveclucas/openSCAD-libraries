gusset();

module gusset(w=20,h=50,t=5,f=5){
    path=[
    [0,0],
    [0,w],
    [f,w],
    [h,f],
    [h,0]
    ];
    rotate([0,-90,0])linear_extrude(t)polygon(path);
}
