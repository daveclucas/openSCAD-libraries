//flange dims

listFlangeDims(index=4);

ASA150=[
[1/2,88.9,30.2,35,11.2,15.7,47.8,21.3,60.3,4,16],
[3/4,98.6,38.1,43,12.7,20.8,52.3,26.7,70,4,16],
[1,108,49,50.8,14.2,26.7,55.6,33.5,79.5,4,16],
[1.25,117.6,58.7,63.5,16,35,57.15,42.2,88.9,4,16],
[1.5,127,65,73.2,17.5,40.9,62,48,98.5,4,16],
[2,152.4,77.7,92.2,19,52.6,63.5,60.5,120.65,4,19],
[2.5,177.8,90.4,104.9,22.35,62.74,69.85,73.15,139.7,4,19],
[3,190.5,107.95,127,23.88,78,69.85,88.9,152.4,4,19],
[3.5,215.9,122.17,139.7,23.88,90.2,71.37,101.6,177.8,8,19],
[4,228.6,134.88,157.2,23.88,102.36,76.2,114.3,190.5,8,19],
[5,254,163.58,185.67,23.88,128.27,88.9,141.2,215.9,8,22],
[6,279.4,192,215.9,25.4,154.18,88.9,168.4,241.3,8,22],
[8,342.9,246.13,270,28.7,202.69,101.6,219.2,298.45,8,22],
[10,406.4,304.8,323.85,30.226,254.508,101.6,273.05,361.95,12,25],
[12,482.6,365.252,381,31.75,304.8,114.3,323.85,431.8,12,25],
[14,533.4,400.05,412.75,35.052,336.55,127,355.6,476.25,12,29],
[16,596.9,457.2,469.9,36.576,387.35,127,406.4,539.75,16,29],
[18,635,504.952,533.4,39.624,438.15,139.7,457.2,577.85,16,32],
[20,698.5,558.8,584.2,42.926,488.95,144.526,508,635,20,32],
[22,749.3,615.95,641.35,45.974,539.75,149.352,558.8,692.15,20,35],
[24,812.8,663.702,692.15,47.752,590.55,152.4,609.6,749.3,20,35]
];

module listFlangeDims(index=0){
    abbreviation=[0,"dn","nominal diameter",1,"D","outside diameter",2,"X","hub diameter",3,"G","raised face diameter",4,"t","flange thickness",5,"B1","hub length",6,"T1","overall length",7,"A","weld neck od",8,"pcd","bolt circle diameter",9,"hole","bolt hole diameter",10,"n","number of bolts"];
    n=len(ASA150[0]);
    for(i=[0:n-1]){
        echo(abbreviation[i*3],abbreviation[i*3+2],ASA150[index][i]);
    }
}