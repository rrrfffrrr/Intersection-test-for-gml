
#define newVec
///newVec(x, y, z <if vec3>, w <if vec4>)
if argument_count < 2 || argument_count > 4 {
    return 0;
}
var array, s, i;
s = argument_count;
array[s-1] = 0;

for(i = 0; i < s; i+=1) {
    array[i] = argument[i];
}

return array;

#define cpyVec
///cpyVec(vec)
var array, a, s, i;
a = argument0;
s = array_length_1d(a);

for(i = 0; i < s; i+=1) {
    array[i] = a[i];
}

return array;

#define addVec
///addVec(vec, vec)
var size1, size2, i, a1, a2, a3;
size1 = array_length_1d(argument0);
size2 = array_length_1d(argument1);

if size1 < size2 {
    return argument0;
}

a1 = cpyVec(argument0);
a2 = argument1;

for(i = 0; i < size2; i+=1) {
    a1[@ i] += a2[i];
}

return a1;

#define subVec
///subVec(vec, vec)
var size1, size2, i, a1, a2;
size1 = array_length_1d(argument0);
size2 = array_length_1d(argument1);

if size1 < size2 {
    return argument0;
}

a1 = cpyVec(argument0);
a2 = argument1;

for(i = 0; i < size2; i+=1) {
    a1[@ i] -= a2[i];
}

return a1;

#define mulVec
///mullVec(vec, value)
var a1, a2, i, s;

if is_array(argument0) {
    a1 = cpyVec(argument0);
    a2 = argument1;
} else {
    a1 = cpyVec(argument1);
    a2 = argument0;
}

s = array_length_1d(a1);

for(i = 0; i < s; i+=1) {
    a1[@ i] *= a2;
}

return a1;

#define divVec
///divVec(vec, value)
var a1, a2, i, s;

if is_array(argument0) {
    a1 = cpyVec(argument0);
    a2 = argument1;
} else {
    a1 = cpyVec(argument1);
    a2 = argument0;
}

s = array_length_1d(a1);

for(i = 0; i < s; i+=1) {
    a1[@ i] /= a2;
}

return a1;

#define lengthVec
///lengthVec(vec)
var a, s, i, value;
a = argument0;
s = array_length_1d(a);
value = 0;

for(i = 0; i < s; i+=1) {
    value += sqr(a[i]);
}

return sqrt(value);

#define lengthSqrVec
///lengthSqrVec(vec)
var a, s, i, value;
a = argument0;
s = array_length_1d(a);
value = 0;

for(i = 0; i < s; i+=1) {
    value += sqr(a[i]);
}

return value;

#define normalizeVec
///normalizeVec(vec)
var a1, mag;
a1 = cpyVec(argument0);
mag = lengthVec(a1);
a1 = divVec(a1, mag);
return a1;

#define dotVec
///dotVec(vec, vec)
var a1, a2, value, s1, s2, i;
a1 = argument0;
a2 = argument1;
s1 = array_length_1d(a1);
s2 = array_length_1d(a2);
value = 0;

if s2 == s1 {
    for(i = 0; i < s1; i+=1) {
        value += a1[i] * a2[i];
    }
}

return value;

#define crossVec
///crossVec(vec, vec)
var array = 0, a1, a2;
a1 = argument0;
a2 = argument1;
if 3 != array_length_1d(a1) || 3 != array_length_1d(a2) {
    return a1;
}

array[0] = a1[1] * a2[2] - a1[2] * a2[1];
array[1] = a1[2] * a2[0] - a1[0] * a2[2];
array[2] = a1[0] * a2[1] - a1[1] * a2[0];

return array;