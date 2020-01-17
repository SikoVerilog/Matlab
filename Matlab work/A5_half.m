x = [-19.875 -12.0625 -20.375 15.9375 10.3125 4.3125 11.8125 13.1875 -4.8125 -2.6875];
h = [-4.0625 0 -2.0625 5.3125 0 6.5];

x = fi(x);
h = fi(h);
fix = conv(x,h);
MES= ones(6,5,1);

for i = 0:1:5
    x1 = fi(x,1,5,(5-i));
    for j = 0:1:4
       h1 = fi(h,1,4,(4-i));
       cal = fi(conv(x1,h1),1,9,(9-i-j));
       error = fix - cal;
       sum = 0;
       for k = 1:1:length(error)
          sum = sum + error(k)*error(k) ;
       end
       MSE(i+1,j+1) = sum/length(error)
    end
end

plot3(1:5,1:5,MSE(1,1:5))
hold on 
plot3(1:5,1:5,MSE(2,1:5))
hold off
hold on 
plot3(1:5,1:5,MSE(3,1:5))
hold off
hold on 
plot3(1:5,1:5,MSE(4,1:5))
hold off
hold on 
plot3(1:5,1:5,MSE(5,1:5))
hold off
hold on 
plot3(1:5,1:5,MSE(6,1:5))
hold off
xlabel('X= 0.5 to 5.0')
ylabel('H= 0.4 to 4.0')
zlabel('MSE')
[V I]=min(MSE(:))
xd = floor(I/6)
xf = 5-xd

hf = mod(I,6)
hd = 4-hf


file = fopen("C:/Users/Sanaullah/Desktop/ADSD/Matlab work/input_half.txt","w")
h1 = fi(h,1,hf+hd,hf)
x1 = fi(x,1,xf+xd,xf)
for v = 1:1:6
    fprintf(file,"%s\n",bin(h1(v)));
end
for v = 1:1:x1.length
    fprintf(file,"%s\n",bin(x1(v)));
end
fclose(file);
out1 = conv(x1,h1);
out1 = fi(out1,1,9,0)
file = fopen("C:/Users/Sanaullah/Desktop/ADSD/Matlab work/matlab_output_half.txt","w")
for v = 1:1:out1.length
    fprintf(file,"%s\r\n",bin(out1(v)));
end
fclose(file);

file = fopen("C:/Users/Sanaullah/Desktop/ADSD/Matlab work/vivado_output2_2.txt","r")
f = textscan(file,'%s','Delimiter','\r\n')
fclose(file);

ok = 0;

for v = 1:1:15
   if q2dec(f{1}{v},8,0,'bin')~= out1(v)
       ok =1
   end
end
if ok == 0 
   fprintf('vivado and matlab answer is same') 
end
    