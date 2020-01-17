x = [-19.875 -12.0625 -20.375 15.9375 10.3125 4.3125 11.8125 13.1875 -4.8125 -2.6875];
h = [-4.0625 0 -2.0625 5.3125 0 6.5];

x = fi(x);
h = fi(h);

fix = conv(x,h);
% MSE
MSE = [];
MAE = [];
WCE = [];
S = ["I", "I1", "H1", "H2", "H3", "H4", "H5", "H6"];
int = [9, 15, 15, 15, 11, 15, 15, 15];
frac = [8, 16, 16, 16, 8, 16, 16, 16];
for I=1:8
    Path = "C:/Users/Sanaullah/Desktop/ADSD/Project/Matlab/vivado_"+S{I}+".txt";
    file = fopen(Path,"r");
    f = textscan(file,'%s','Delimiter','\r\n');
    fclose(file);

    sum = 0;
    ab = 0;
    for v = 1:1:length(fix)
        error = fix(v) - q2dec(f{1}{v},int(I),frac(I),'bin');
        worst(v) = abs(error);
        ab = ab + abs(error);
        error = error * error;
        sum = sum + error;
    end
    MSE = [MSE, sum / length(fix)];
    MAE = [MAE, ab / length(fix)];
    WCE = [WCE, max(worst)];
end
%
lut = [211 0 453 514 266 557 562 557]
ff = [68 48 112 14 70 110 110 110]
dsp = [0 4 0 0 0 0 0 0]
freq = [238.892 150.852 184.169 170.329 224.568 159.898 155.666 159.134]
total_power =   [0.295 0.290 0.319 0.315 0.298 0.317 0.315 0.316]
dynamic_power = [0.053 0.048 0.077 0.072 0.056 0.074 0.072 0.074]
clock_power =   [0.005 0.003 0.005 0.004 0.005 0.004 0.004 0.004]
signal_power =  [0.004 0.001 0.013 0.010 0.006 0.015 0.015 0.015]
logic_power =   [0.004 0.0005 0.006 0.008 0.004 0.013 0.013 0.013]
dsp_power =     [0     0.005  0     0    0     0     0     0]
io_power =      [0.040 0.040 0.053 0.050 0.041 0.042 0.041 0.041]
static_power =  [0.242 0.242 0.243 0.243 0.242 0.243 0.243 0.243]
Resourse = [lut; ff; dsp]';
bar(Resourse);
title('LUT, FF and DSP Usage');
xlabel('Precision');
ylabel('Usage');
legend('LUT', 'FF', 'DSP');
set(gca,'xtickLabel', S);

% figure
% bar(ff)
% title('FF Usage');
% xlabel('Precision');
% ylabel('FF');
% set(gca,'xtickLabel', S);
% 
% figure
% bar(dsp)
% title('DSP Usage');
% xlabel('Precision');
% ylabel('DSP');
% set(gca,'xtickLabel', S);
error  = [MSE; MAE; WCE]';
figure
bar(error)
title('MSE, MAE and WCE Error');
xlabel('Precision');
ylabel('error');
legend('MSE', 'MAE', 'WCE');
set(gca, 'YScale', 'log')
set(gca,'xtickLabel', S);

% figure
% bar(MAE)
% title('MAE');
% xlabel('Precision');
% ylabel('error');
% set(gca,'xtickLabel', S);
% 
% figure
% bar(WCE)
% title('WCE');
% xlabel('Precision');
% ylabel('error');
% set(gca,'xtickLabel', S);

power = [total_power; static_power; dynamic_power]';
figure
bar(power)
title('Total, Static and Dynamic Power');
xlabel('Precision');
legend('Total Power', 'Static Power', 'Dynamic Power');
set(gca,'xtickLabel', S);

% figure
% bar(static_power)
% title('Static Power');
% xlabel('Precision');
% ylabel('Power');
% set(gca,'xtickLabel', S);
% 
% figure
% bar(dynamic_power)
% title('Dynamic Power');
% xlabel('Precision');
% ylabel('Power');
% set(gca,'xtickLabel', S);

d = [clock_power; signal_power; logic_power; dsp_power; io_power]';
figure
bar(d, 'stacked')
title('Components of Dynamic Power');
xlabel('Precision');
ylabel('Power');
legend('Clock', 'Signal', 'Logic', 'DSP', 'I/O')
set(gca,'xtickLabel', S);


figure
bar(freq)
title('Frequency');
xlabel('Precision');
ylabel('Max Frequency');
set(gca,'xtickLabel', S);
