function [] = UpdateBoard(a,x,pins)
% UpdateBoard function for LED lights
% Will turn on/off depending on value in board array
for c = 1:1:9
    if x(c) ==1
        writeDigitalPin(a,pins(c),1)
    elseif x(c)== 0
        writeDigitalPin(a,pins(c),0)
    end
end
end

