clear, clc
a = arduino('COM3');
counter = 0;

% make an array of pin values
pins = ["D12", "D11", "D10";
        "D8", "D7", "D6";
        "D4", "D3", "D2"];
% rotate the pins array 270 degrees clockwise

while counter < 100
    numlightened = randi([3,7]); % decide # of lights lightened
    poslightened = randperm(9, numlightened); % decide positions
    arr = zeros(3);
    arr(poslightened) = 1; % logical array representing lights on

    if numlightened == 3
        counter = counter + 1;
    end
    
    for c = 1:9 % loop that goes through all lights
        writeDigitalPin(a, pins(c), arr(c));
    end
    
    pause(1)
end

%% after exit condition is met, turn all lights off
for c = 1:9
    writeDigitalPin(a, pins(c), 0);
end

