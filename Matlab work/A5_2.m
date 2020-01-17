x = [-19.875 -12.0625 -20.375 15.9375 10.3125 4.3125 11.8125 13.1875 -4.8125 -2.6875];
h = [-4.0625 0 -2.0625 5.3125 0 6.5];

x = fi(x);
h = fi(h);
%half
%10 to 5
%8 to 4
%quater
%5 to 3
%4 to 2
x1 = fi(x,1,3,0)
h1 = fi(h,1,2,0)

y = conv(x,h)
y1 = conv(x1,h1)
sum = 0;
for i=1:1:length(y)
    error = y(i)-y1(i);
    error2 = error * error;
    sum = sum + error2;
end
MES = sum/length(y)
plot(y)
title('X5.4, H3.4')
hold on 
plot(y1)
hold off

