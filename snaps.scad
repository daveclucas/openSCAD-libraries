/*simple Snap library based on "Snap-Fit Joints for Plastics - A Design Guid" by Bayer MaterialScience LLC 
  http://fab.cba.mit.edu/classes/S62.12/people/vernelle.noel/Plastic_Snap_fit_design.pdf
 
 on http://www.thingiverse.com/thing:1860118
 
    by fpetrac Fausto Petraccone fpetrac@gmail.com 
    Licensed under the Creative Commons - Attribution - Non-Commercial license.
*/

/*Rev
    SnapLib 0.36.scad: added SnapHoleY function  
    SnapLib 0.35.scad: on RSnapY added a check to avioid interference of lobes during closure; on RRSnappY added a check to avioid overlapped lobes.
    SnapLib 0.30.scad  added function Hsnap and Snap to calculate the snap H or Y for cantilever snap
    SnapLib 0.25.scad  added Scale factor f to reduce the calculate value h or y (this mantain the snap on unbreakable zone when f>1)
    Snaprofile = 12; // [1:MXL, 2:40DP, 3:XL, 4:H, 5:T2.5, 6:T5, 7:T10, 8:AT5, 9:HTD_3mm, 10:HTD_5mm, 11:HTD_8mm, 12:GT2_2mm, 13:GT2_3mm, 14:GT2_5mm]
pLib 0.20.scad  Bug Fix
    SnapLib 0.10.scad  addedroot=5 RSnapY RRSnapY
    SnapLib 0.00.scad  first release
*/

/*
eps=0.5*6/100;//Elongation at break of PLA=6%
eps=0.5*12/100;//Elongation at break of ABS=12%
eps=0.5*18/100;//Elongation at break of PETG=18%
*/
//**************** variable *****************
eps=0.5*6/100;//Elongation at break of PLA=6%
la=1.5;  //arm length(x)
root=4; //arm thickness at root
uCut=1; //undercut depth(deflection)
l=30;   //overall length of clip
w=5;    //arm width
f=1;    //factor
lobes=6;    //number of lobes in circular clips
help=false; //help message
angle=30;   //taper angle
h=root; //arm root thickness
Pr=2;   //thickness ratio



//******************* functions **************************
//function arm(l=10,w=4)=[[0,0],[l,0],[l,-w/2],[0,-w]];
function arm(la=la,root=3,y=1,xLand=1,angle=30,yLand=1)=[[0,0],[la,0],[la,y],[la+xLand,y],[la+xLand+y/tan(angle),0],[la+xLand+y/tan(angle),-yLand],[la,-root/2],[0,-root]];
function hArm(la=10,y=1,root=3,angle=30)=[[0,0],[la,0],[la,y],[la+y,y],[la+y+(y+root/4)/tan(angle),-root/4],[la,-root/2],[0,-root]];
function Hsnap(la,y,f)= (1.09/f)*(eps*pow(la,2))/(y);
function Ysnap(la,root,f)= (1.09/f)*(eps*pow(la,2))/(root);

//Example: 
//SnapY(la=10,root=5,uCut=1,l=30,w=4,help=true);


//y=min(Ysnap(la,root,f),uCut);
//echo("y =",y);

profile = 1; // [1:SnapY, 2:SnapH, 3:SnapHoleY, 4:RSnapY, 5:RRSnapY,6:null]
if ( profile == 1 ) {SnapY(la=10,root=3,uCut=1,l=30,w=4,f=1,help=false ); }
if ( profile == 2 ) {SnapH(la=10,root=3,uCut=1,angle=30,w=4,f=1,help=false); }
if ( profile == 3 ) {SnapHoleY(la=10,root=1,angle=30,w=5,f=1,Pr); }
if ( profile == 4 ) {RSnapY(la=10,root=3,angle=30,lobes=6,r2=5,f=1,K2=2); }
if ( profile == 5 ) {RRSnapY(la=10,root=3,angle=30,lobes=6,r2=5,f=1,K1=2); }



//SnapH(l=length,y,a=angle,b=width,f=1) Define y calculate h and divide the calculte h value to a factor f

//********************************************************
module SnapH(la=10,uCut=1,root=5,angle=30,w=4,f=1,help=false)   
{
    y=min(Ysnap(la,root,f),uCut); echo("y = ",y);
    root=Hsnap(la,y,f); //(length,depth,factor)
linear_extrude(height = w, center = f, convexity = 10, twist = 0)
polygon(arm());
}

//SnapY(la,root,uCut,l,w,f,help) 
//Define root calculate y and divide the calculated y value by a factor f

//********************************************************
module SnapY(la=10,root=3,uCut=1,l=30,w=4,f=1,help=false){
    helpText="Usage:\nmodule SnapY(la,root,uCut,l,w,f,help=false)\n
    la=length of clip from root of arm to hook(x)\n
    root=width of arm at root,\n
    uCut=depth of undercut(hook protrusion)\n
    l=overall length of clip(x)\n
    w=width of arm(z)\n
    f=factor)";
    if(help)echo(helpText);
    y=min(Ysnap(la,root,f),uCut);
//     translate([la,0,0])linear_extrude(w)polygon(hook(root/2,y,1,l,1));
    linear_extrude(w)polygon(arm());
}

//********************************************************
//SnapHoleY(l,h,a,b,f=1,Pr=2) Define h calculate y and divide the calculate y value to a factor f the total hole depth is h*PR
//SnapHoleY(la=10,root=2,angle=30,w=4,Pr=2,f=1);

module SnapHoleY(la=10,root=3,angle=30,uCut=1,l=30,w=3,f=1,Pr=2){
    helpText="Usage:\nmodule SnapHoleH(la,root,uCut,l,w,f,Pr,help=false)\n
    la=length of clip from root of arm to hook(x)\n
    root=width of arm at root,\n
    uCut=depth of undercut(hook protrusion)\n
    l=overall length of clip(x)\n
    w=width of arm(z)\n
    f=factor\n
    Pr=thickness ratio";
    
    if(help)echo(helpText);  
    y=min(Ysnap(la,root,f),uCut); 
    YY=Pr*root;//depth Y;
    echo(Pr,root);
    XX=1.1*(y+(y+root/4)/tan(angle)); //total height +10%
    ZZ=0+w; //width plus tolerance
 //   union(){
        translate([0,-YY,(w-ZZ)/2])cube([la,YY,ZZ],center=false); //stem
        translate([la,-YY,(w-ZZ)/2])cube([XX,YY+y,ZZ],center=false);//head
 //   }    
 }


//Define h calculate y and divide the calculated value to f
 
//********************************************************
module RSnapY(la,root,angle,lobes,r2=0,f=1,K2=2)   
{
    Theta=180/lobes;
    y=(1.64/f)*K2*(eps*pow(la,2))/(r2);
    p=y;
//    if(((r2-root)>y)&&(root<r2)){ //(r2-root)>y should be (r2-root/2)>y and  root<r2 for scad problem
    assert(r2-root>y&&root<r2,"WARNING:");
    for(f=[0:1:lobes])
        rotate([0,0,Theta*2*f])
        rotate_extrude(angle = Theta, convexity = 2,$fn=200)
        translate([r2,0,0])
        mirror([1,-1,0])
        polygon(hArm());
 /*   }
    else{
      echo ("WARNING:");
      echo("y should be < r2-root,  y = ",y,", r2-root = ",r2-root);
      echo("root should be < r2 ");
    }*/
}
//Define h calculate y and divide the calculated value to f

//********************************************************
module RRSnapY(la,root,angle,lobes,r2=5,f=1,K1=2)
{
    Theta=180/lobes;
    y=(1.64/f)*K1*(eps*pow(la,2))/(r2);
    p=y;
    echo("y is", y);
    echo("r1/r2",(r2-h)/r2);
    echo("Theta", Theta);
    echo("r2-y",(r2-y));
    if(y<r2){
      for(f=[0:1:lobes])
          rotate([0,180,Theta*2*f])
              rotate_extrude(angle = Theta, convexity = 2,$fn=200)
                  translate([r2,0,0])
                      mirror([1,1,0])
                          polygon([[0,0],[la,0],[la,y],[la+p,y],[la+p+(y+root/4)/tan(angle),-root/4],[la,-root/2],[0,-root]]);
  }
      else{
      echo ("<b>WARNING:</b>");
      echo("y should be < r2 ");
      }
}
