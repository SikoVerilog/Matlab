luthalf = [159, 156, 156, 156, 158, 158];
ffhalf = [34, 34, 34, 34, 34, 34]
dsphalf = [0, 0, 0 ,0, 0, 0]
freqhalf = [83.33, 105.263,100, 111.111, 125, 127.877]

lutfull = [539, 539, 539, 539, 544, 548];
fffull = [68, 68, 68, 68, 68, 68]
dspfull = [0, 0, 0, 0, 0, 0]
freqfull = [55, 62.500, 66.666, 90.909, 95.238, 100]

lutquat = [44, 45, 55, 57, 58, 59];
ffquat = [20, 20, 20, 20, 20, 20]
dspquat = [0, 0, 0, 0, 0, 0]
freqquat = [166.667, 200, 250, 266.667, 277.778, 280.899]
stem(ones(size(lutquat)) * 5,lutquat)
hold on
stem(ones(size(lutfull)) * 18,lutfull)
stem(ones(size(luthalf)) * 9,luthalf)
hold off
xlabel('Bit With')
ylabel('LUT usage')

figure

stem(ones(size(ffquat)) * 5,ffquat)
hold on
stem(ones(size(fffull)) * 18,fffull)
stem(ones(size(ffhalf)) * 9,ffhalf)
hold off
xlabel('Bit With')
ylabel('FF usage')

figure

stem(ones(size(dspquat)) * 5,dspquat)
hold on
stem(ones(size(dspfull)) * 18,dspfull)
stem(ones(size(dsphalf)) * 9,dsphalf)
hold off
xlabel('Bit With')
ylabel('DSP usage')

figure

stem(ones(size(freqquat)) * 5,freqquat)
hold on
stem(ones(size(freqfull)) * 18,freqfull)
stem(ones(size(freqhalf)) * 9,freqhalf)
hold off
xlabel('Bit With')
ylabel('Frequency')