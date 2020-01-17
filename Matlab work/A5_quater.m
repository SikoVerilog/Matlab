x = [-19.875 -12.0625 -20.375 15.9375 10.3125 4.3125 11.8125 13.1875 -4.8125 -2.6875];
h = [-4.0625 0 -2.0625 5.3125 0 6.5];

x = fi(x);
h = fi(h);
fix = conv(x,h);
MES= ones(4,3,1);

for i = 0:1:3
    x1 = fi(x,1,3,(3-i));
    for j = 0:1:2
       h1 = fi(h,1,2,(2-i));
       cal = fi(conv(x1,h1),1,5,(5-i-j));
       error = fix - cal;
       sum = 0
       for k = 1:1:length(error)
          sum = sum + error(k)*error(k) ;
       end
       MSE(i+1,j+1) = sum/length(error)
    end
end

plot3(1:3,1:3,MSE(1,1:3))
hold on 
plot3(1:3,1:3,MSE(2,1:3))
hold off
hold on 
plot3(1:3,1:3,MSE(3,1:3))
hold off
hold on 
plot3(1:3,1:3,MSE(4,1:3))
hold off

xlabel('X= 0.3 to 3.0')
ylabel('H= 0.2 to 2.0')
zlabel('MSE')
[V I]=min(MSE(:))
xd = floor(I/4)
xf = 3-xd

hf = mod(I,3)
hd = 2-hf


file = fopen("C:/Users/Sanaullah/Desktop/ADSD/Matlab work/input_quater.txt","w")
h1 = fi(h,1,hf+hd,hf)
x1 = fi(x,1,xf+xd,xf)
for v = 1:1:6
    fprintf(file,"%s\n",bin(h1(v)));
end
for v = 1:1:x1.length
    fprintf(file,"%s\n",bin(x1(v)));
end
fclose(file);
out2 = conv(x1,h1);
out1 = fi(out2,1,9,0)
file = fopen("C:/Users/Sanaullah/Desktop/ADSD/Matlab work/matlab_output_quater.txt","w")
for v = 1:1:out1.length
    fprintf(file,"%s\r\n",bin(out1(v)));
end
fclose(file);

file = fopen("C:/Users/Sanaullah/Desktop/ADSD/Matlab work/vivado_output_2_4.txt","r")
f = textscan(file,'%s','Delimiter','\r\n')
fclose(file);

ok = 0;

for v = 1:1:15
   if q2dec(f{1}{v},4,0,'bin')~= out2(v)
       ok =1
   end
end
if ok ==0 
   fprintf('vivado and matlab answer is same') 
end
    