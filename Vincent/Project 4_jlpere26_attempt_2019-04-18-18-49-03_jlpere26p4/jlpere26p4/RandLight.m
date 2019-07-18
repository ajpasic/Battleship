function [] = RandLight(a,pins)
% This function will light up a random number of LEDs in random
% locations on the breadboard. 
rt = randperm(9,9);
xx = randi(9,1);
for rr = 1:1:xx
        writeDigitalPin(a,pins(rt(rr)),1)
end
fprintf('The randomly selected number LEDs that lit up are %0.0f\n',xx)
pause(5)
for rr = 1:1:xx
    writeDigitalPin(a,pins(rt(rr)),0)
end
end

