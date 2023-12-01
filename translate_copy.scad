
translate_copy(vector=[20,0,0])cube(10,center=true);

module translate_copy(vector=[1,0,0]){
    children();
    translate(vector) children();
}
