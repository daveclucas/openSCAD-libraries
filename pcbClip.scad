use <snapLib/SnapLib.0.36.scad>
use<mirror_copy.scad>

pcbClip();



module pcbClip(width=26,height=26,r=13,t=1.6,root=5,w=4,la=10,uCut=2,help=false){
    helpText="pcbClip Usage:\nmodule pcbClip(width,height,r,t,root,w,la)\n
    width=internal width of clip(y),height=height of clip from base to hook(x)\n
    r=radius of internal fillet or hole, t= thickness of pcb\n
    root=thickness of clip at root(z)\n
    w=width of arm(y)
    la=length of arm from root to hook\n
    uCut=undercut or protrusion of hook(y)";
    if(help)echo(helpText);
    //**************** calculated variables **************** 
    bh=height-la; echo(bh); 
    difference(){
        union(){    //main body
            mirror_copy([0,1,0]){
                rotate([0,0,180])cube([bh,width/2+root,w]); //base
                translate([0,-width/2,0])
                SnapY(la=height/2,root=root,l=30,w=w);  //arm a=angle
            }
        }
        cylinder(h=3*w,r=r,$fn=28,center=true); //centre hole or fillet
    }
    mirror_copy([0,1,0])translate([0.5+la-t,-width/2,0])cube([2,2*uCut,w]);
}
