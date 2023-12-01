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
    SnapLib 0.10.scad  added RSnapY RRSnapY
    SnapLib 0.00.scad  first release
*///Example: 
//SnapY(la=10,root=5,uCut=1,l=30,w=4,help=true);

la=10;  //arm length(x)
root=3; //arm thickness at root
uCut=1;l=30;
w=4;    //arm width
f=1;    //factor
help=false; //help message

h=root;


/*
eps=0.5*6/100;//Elongation at break of PLA=6%
eps=0.5*12/100;//Elongation at break of ABS=12%
eps=0.5*18/100;//Elongation at break of PETG=18%
*/


profile = 1; // [1:SnapY, 2:SnapH, 3:SnapHoleY, 4:RSanapY, 5:RRSnapY]
if ( profile == 1 ) {SnapY(la=10,root=3,uCut=1,l=30,w=4,f=1,help=false ); }
if ( profile == 2 ) {SnapH(l,root,uCut,w,f=1,help); }
if ( profile == 3 ) {SnapHoleY(l=10,h=3,uCut=1,a=30,b=3,f=1,Pr=2); }
if ( profile == 4 ) {RSnapY(l,h,a,Lobi,r2,f=1,K2=2); }
if ( profile == 5 ) {RRSnapY(l,h,a,Lobi,r2,f=1,K1=2); }

eps=0.5*6/100;//Elongation at break of PLA=6%

//******************* functions **************************
function arm(l=10,w=4)=[[0,0],[l,0],[l,-w/2],[0,-w]];
function hook(width=4,uCut=1,xLand=1,angle=30,yLand=1)=[[0,0],[0,uCut],[xLand,uCut],[xLand+uCut/tan(angle),0],[xLand+uCut/tan(angle),-yLand],[0,-width]];
function Hsnap(l,y,f)= (1.09/f)*(eps*pow(la,2))/(y);
function Ysnap(l,h,f)= (1.09/f)*(eps*pow(la,2))/(h);

//SnapH(l=length,y,a=angle,b=width,f=1) Define y calculate h and divide the calculte h value to a factor f

//********************************************************
module SnapH(la,uCut,root,w,f=1)   
{
    h=Hsnap(l,y,f); //(length,depth,factor)
    p=y;
    
linear_extrude(height = b, center = f, convexity = 10, twist = 0)
polygon([[0,0],[l,0],[l,y],[l+p,y],[l+p+(y+h/4)/tan(a),-h/4],[l,-h/2],[0,-h]]);
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
     translate([la,0,0])linear_extrude(w)polygon(hook(root/2,uCut,1,l,1));
    linear_extrude(w)polygon(arm(la,root));
}

//********************************************************
//SnapHoleY(l,h,a,b,f=1,Pr=2) Define h calculate y and divide the calculte y value to a factor f the total hole depth is h*PR
module SnapHoleY(l=10,h=3,uCut=1,a=30,b=3,f=1,Pr=2){
        //%SnapY(l,h,a,b);  
        y=min(Ysnap(l,h,f),uCut); 
        YY=Pr*h;//depth Y;
        XX=1.1*(y+(y+h/4)/tan(a)); //Altezza totale +10%
        ZZ=0+b; //largezza piu tolleranza
        union(){
            translate([0,-YY,(b-ZZ)/2])cube([l,YY,ZZ],center=false); //gambo
            translate([l,-YY,(b-ZZ)/2])cube([XX,YY+y,ZZ],center=false);//testa
        }    
 }


//Define h calculate y and divide the calculated value to f
 
//********************************************************
module RSnapY(l,h,a,Lobi,r2,f=1,K2=2)   
{
    Theta=180/Lobi;
    y=(1.64/f)*K2*(eps*pow(l,2))/(r2);
    p=y;
    if(((r2-h)>y)&&(h<r2)){ //(r2-h)>y should be (r2-h/2)>y and  h<r2 for scad problem
      for(f=[0:1:Lobi])
          rotate([0,0,Theta*2*f])
              rotate_extrude(angle = Theta, convexity = 2,$fn=200)
                  translate([r2,0,0])
                      mirror([1,-1,0])
                          polygon([[0,0],[l,0],[l,y],[l+p,y],[l+p+(y+h/4)/tan(a),-h/4],[l,-h/2],[0,-h]]);
    }
    else{
      echo ("<b>WARNING:</b>");
      echo("y should be < r2-h ");
      echo("h should be < r2 ");
    }
}
//Define h calculate y and divide the calculated value to f

//********************************************************
module RRSnapY(l,h,a,Lobi,r2,f=1,K1=2)
{
    Theta=180/Lobi;
    y=(1.64/f)*K1*(eps*pow(l,2))/(r2);
    p=y;
    echo("y is", y);
    echo("r1/r2",(r2-h)/r2);
    echo("Theta", Theta);
    echo("r2-y",(r2-y));
    if(y<r2){
      for(f=[0:1:Lobi])
          rotate([0,180,Theta*2*f])
              rotate_extrude(angle = Theta, convexity = 2,$fn=200)
                  translate([r2,0,0])
                      mirror([1,1,0])
                          polygon([[0,0],[l,0],[l,y],[l+p,y],[l+p+(y+h/4)/tan(a),-h/4],[l,-h/2],[0,-h]]);
  }
      else{
      echo ("<b>WARNING:</b>");
      echo("y should be < r2 ");
      }
}
