function [light] = RandLight(a)
%David Mitchell
%Purpose: Lights up a random number of LEDs in random locations
pins = ["D12","D11","D10";"D9","D8","D7";"D6","D5","D4"];
board = randi([0 1],3,3);
for x = 1:9
    writeDigitalPin(a,pins(x),board(x))
end
light = 0;
for y = 1:9
    if board(y) == 1
        light = light + 1;
    end
end

fprintf('There are %0.0f LEDs that are lit.',light);
fprintf('\n');
