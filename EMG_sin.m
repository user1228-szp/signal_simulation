clear
close all
clc

fs = 1000;
d = 3;
t = 0:1/fs:d;
%% importante
A = 1;
sd = 0.2;
ev = 3;
EMG =zeros(1,length(t));
for i=1:ev
    inxI = randi(length(t));
    inxF = min(length(t),inxI+500);
    act = t(inxI:inxF);
    env= exp(-((act-act(1)).^2)/(2*(sd)^2));
    sng = A*env;
    EMG(inxI:inxF)= EMG(inxI:inxF) + sng.*rand(1,length(act));
end

EMG=EMG+0.1*rand(1,length(t));
figure,plot(t,EMG)


