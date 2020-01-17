x = [-19.875 -12.0625 -20.375 15.9375 10.3125 4.3125 11.8125 13.1875 -4.8125 -2.6875];
h = [-4.0625 0 -2.0625 5.3125 0 6.5];

x = fi(x);
h = fi(h);
x1 = fi(x,1,3,0);
h1 = fi(h,1,2,0);

if x1 == x 
    fprintf("no difference in x on Q 6.4\n");
end
if h1 == h 
    fprintf("no difference in h on Q 4.4\n");
end

file = fopen("C:/Users/Sanaullah/Desktop/ADSD/Matlab work/input_2_4.txt","w")

for v = 1:1:6
    fprintf(file,"%s\n",bin(h1(v)));
end


for v = 1:1:x1.length
    fprintf(file,"%s\n",bin(x1(v)));
end

fclose(file);

out = conv(x,h,'full');
o = conv(x1,h1,'full');
out1 = fi(o,1,5,0)

%if out1 == out 
   fprintf("Output is also same");
   file = fopen("C:/Users/Sanaullah/Desktop/ADSD/Matlab work/matlab_output_2_4.txt","w")
   for v = 1:1:out1.length
      fprintf(file,"%s\r\n",bin(out1(v)));
   end
   fclose(file);
%end
file = fopen("C:/Users/Sanaullah/Desktop/ADSD/Matlab work/vivado_output.txt","r")
f = textscan(file,'%s','Delimiter','\r\n')
fclose(file);