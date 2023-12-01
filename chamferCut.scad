chamferCut(outer=false);

module chamferCut(size=[5,6,7],outer=true){
    if(outer)
    linear_extrude(size.z)polygon([[0,0],[0,-size.y],[-size.x,0]]);
    if(!outer)mirror([1,1,0])
    linear_extrude(size.z)polygon([[0,0],[0,-size.y],[-size.x,0]]);
}