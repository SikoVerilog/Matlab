x = [-19.875 -12.0625 -20.375 15.9375 10.3125 4.3125 11.8125 13.1875 -4.8125 -2.6875];
h = [-4.0625 0 -2.0625 5.3125 0 6.5];
file = fopen("C:/Users/Sanaullah/Desktop/ADSD/Matlab work/input.txt","w")

fprintf('X in 6.4 form')
x1 = fi(x,1,10,4)
fprintf('H in 4.4 form')
h1 = fi(h,1,8,4)
%fprintf(file,"H = \n");
for v = 1:1:6
    fprintf(file,"%s\n",bin(h1(v)));
end

%fprintf(file,"X = \n");

for v = 1:1:x1.length
    fprintf(file,"%s\n",bin(x1(v)));
end

fprintf('X == fi(X,1,10,4)')
x1 == x
fprintf('Binary form of X is:')
bin(x1)
fprintf('H == fi(H,1,8,4)')
h1 == h
fprintf('Binary form of H is:')
bin(h1)
o = x1*h1(1)
bin(o)
out = conv(x,h);
out1 = conv(x1,h1);
out1 = fi(out1,1,18,8);
out == out1
fprintf(file,"%s\n",bin(out1));
%fprintf(file,out1);
%for v = 1:1:out1.length
%    fprintf(file,"%s\n",bin(x1(v)));
%end

fclose(file);