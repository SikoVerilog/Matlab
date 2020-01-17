x = [-19.875 -12.0625 -20.375 15.9375 10.3125 4.3125 11.8125 13.1875 -4.8125 -2.6875];
h = [-4.0625 0 -2.0625 5.3125 0 6.5];

x = fi(x);
h = fi(h);
fix = conv(x,h);

file = fopen("C:/Users/Sanaullah/Desktop/ADSD/project/Matlab/input_I.txt","w")
h1 = fi(h,1,8,4)
x1 = fi(x,1,10,4)
for v = 1:1:6
    fprintf(file,"%s\n",bin(h1(v)));
end
for v = 1:1:x1.length
    fprintf(file,"%s\n",bin(x1(v)));
end
fclose(file);