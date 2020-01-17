x = [-19.875 -12.0625 -20.375 15.9375 10.3125 4.3125 11.8125 13.1875 -4.8125 -2.6875];
h = [-4.0625 0 -2.0625 5.3125 0 6.5];

x = fi(x);
h = fi(h);
fix = conv(x,h);

file = fopen("C:/Users/Sanaullah/Desktop/ADSD/project/Matlab/input_H3.txt","w")
h1 = fi(h,1,10,4)
x1 = fi(x,1,10,4)
for v = 1:1:6
    fprintf(file,"%s\n",bin(h1(v)));
end
for v = 1:1:x1.length
    fprintf(file,"%s\n",bin(x1(v)));
end
fclose(file);

file = fopen("C:/Users/Sanaullah/Desktop/ADSD/Project/Matlab/vivado_H3.txt","r")
f = textscan(file,'%s','Delimiter','\r\n')
fclose(file);

sum = 0;

for v = 1:1:length(fix)
    error = fix(v) - q2dec(f{1}{v},11,8,'bin');
    error = error * error;
    sum = sum + error;
end
MSE = sum / length(fix)
fprintf('Error is = %d', MSE);