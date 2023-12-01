function partial(list,start,end) = [for (i = [start:end]) list[i][2]];

function sumVectors(list, c = 0) = 
 c < len(list) - 1 ? 
 list[c] + sumVectors(list, c + 1) 
 :
 list[c];


d=[[195,203,83],[195,203,43]];

heights=partial(d,0,1); echo(heights);

My_sum1=sumVectors( heights); echo(My_sum1);
My_sum2=sumVectors( d); echo(My_sum2[2]);
