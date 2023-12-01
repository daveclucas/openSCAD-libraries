//function to sum the first n values in an array
function sum_n(arr,n) =
    n > 0 ? arr[n-1] +
        sum_n(arr, n-1) : 0;
 
 arr = [1,2,3,4];
 n=3;
 echo("sum of first ",n, "values = ",sum_n(arr,n));