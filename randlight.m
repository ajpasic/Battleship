clear, clc
a = arduino('COM3');
counter = 0;
while counter < 100
    numlightened = randi([3,7]); % decide # of lights lightened
    poslightened = randperm(9, numlightened); % decide positions
    arr = zeros(3);
    arr(poslightened) = 1;
    % disp(arr);

    if numlightened == 3
        counter = counter + 1;
    end
    
    writeDigitalPin(a, 'D12', arr(1));
    writeDigitalPin(a, 'D11', arr(4));
    writeDigitalPin(a, 'D10', arr(7));
    writeDigitalPin(a, 'D8', arr(2));
    writeDigitalPin(a, 'D7', arr(5));
    writeDigitalPin(a, 'D6', arr(8));
    writeDigitalPin(a, 'D4', arr(3));
    writeDigitalPin(a, 'D3', arr(6));
    writeDigitalPin(a, 'D2', arr(9));
    
    pause(1)
end

writeDigitalPin(a, 'D12', 0);
writeDigitalPin(a, 'D11', 0);
writeDigitalPin(a, 'D10', 0);
writeDigitalPin(a, 'D8', 0);
writeDigitalPin(a, 'D7', 0);
writeDigitalPin(a, 'D6', 0);
writeDigitalPin(a, 'D4', 0);
writeDigitalPin(a, 'D3', 0);
writeDigitalPin(a, 'D2', 0);

