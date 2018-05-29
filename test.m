clear, clc;
a = arduino('COM3', 'Uno');
for i = 1:1:3
writeDigitalPin(a, 'D12', 1);
writeDigitalPin(a, 'D11', 1);
writeDigitalPin(a, 'D10', 1);
writeDigitalPin(a, 'D8', 1);
writeDigitalPin(a, 'D7', 1);
writeDigitalPin(a, 'D6', 1);
writeDigitalPin(a, 'D4', 1);
writeDigitalPin(a, 'D3', 1);
writeDigitalPin(a, 'D2', 1);
pause(1)
writeDigitalPin(a, 'D12', 0);
writeDigitalPin(a, 'D11', 0);
writeDigitalPin(a, 'D10', 0);
writeDigitalPin(a, 'D8', 0);
writeDigitalPin(a, 'D7', 0);
writeDigitalPin(a, 'D6', 0);
writeDigitalPin(a, 'D4', 0);
writeDigitalPin(a, 'D3', 0);
writeDigitalPin(a, 'D2', 0);
pause(1)
end
clear;