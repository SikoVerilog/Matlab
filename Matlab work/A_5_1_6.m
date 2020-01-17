x = [-19.875 -12.0625 -20.375 15.9375 10.3125 4.3125 11.8125 13.1875 -4.8125 -2.6875];
h = [-4.0625 0 -2.0625 5.3125 0 6.5];

x = fi(x);
h = fi(h);
fix = conv(x,h);

x1 = fi(x,1,9,3);
h1 = fi(h,1,7,3);
out = conv(x1,h1);
out1 = fi(out,1,16,6);

file = fopen("C:/Users/Sanaullah/Desktop/ADSD/Matlab work/matlab_output_a.txt","w")
for v = 1:1:out1.length
    fprintf(file,"%s\r\n",bin(out1(v)));
end
fclose(file);
file = fopen("C:/Users/Sanaullah/Desktop/ADSD/Matlab work/input_a.txt","w")
for v = 1:1:6
    fprintf(file,"%s\n",bin(h1(v)));
end

for v = 1:1:x1.length
    fprintf(file,"%s\n",bin(x1(v)));
end
fclose(file);

x2 = fi(x,1,11,4);
h2 = fi(h,1,9,4);
out2 = conv(x2,h2);

file = fopen("C:/Users/Sanaullah/Desktop/ADSD/Matlab work/matlab_output_b.txt","w")
for v = 1:1:out1.length
    fprintf(file,"%s\r\n",bin(out2(v)));
end
fclose(file);
file = fopen("C:/Users/Sanaullah/Desktop/ADSD/Matlab work/input_b.txt","w")
for v = 1:1:6
    fprintf(file,"%s\n",bin(h2(v)));
end

for v = 1:1:x1.length
    fprintf(file,"%s\n",bin(x2(v)));
end
fclose(file);


file = fopen("C:/Users/Sanaullah/Desktop/ADSD/Matlab work/vivado_output_a.txt","r")
f = textscan(file,'%s','Delimiter','\r\n')
fclose(file);

file = fopen("C:/Users/Sanaullah/Desktop/ADSD/Matlab work/vivado_output_b.txt","r")
f1 = textscan(file,'%s','Delimiter','\r\n')
fclose(file);


sum =0;
sum1 =0;
for v = 1:1:15
   
   error1 = q2dec(f1{1}{v},11,8,'bin') - fix(v)
   error1 = error1 * error1;
   sum1 = sum1 + error1;
    
   error = q2dec(f{1}{v},9,6,'bin') - fix(v);
   error = error * error;
   sum = sum + error;
end
MSE = sum / 15
MSE1 = sum1 / 15