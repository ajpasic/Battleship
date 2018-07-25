clc, clear;
% Check device manager for COM #
a = arduino('COM3','Uno');
% the game starts here
% set the number of battleships
bsnum = 2;
% set the position of battleships
shiploc = ShipLocations(2);
disp('Battleship locations');
disp(shiploc);
% prompt user for row and column of the battleships

% for i = 1:1:3
writeDigitalPin(a, 'D12', shiploc(1));
writeDigitalPin(a, 'D11', shiploc(4));
writeDigitalPin(a, 'D10', shiploc(7));
writeDigitalPin(a, 'D8', shiploc(2));
writeDigitalPin(a, 'D7', shiploc(5));
writeDigitalPin(a, 'D6', shiploc(8));
writeDigitalPin(a, 'D4', shiploc(3));
writeDigitalPin(a, 'D3', shiploc(6));
writeDigitalPin(a, 'D2', shiploc(9));
pause(1)
% writeDigitalPin(a, 'D12', 0);
% writeDigitalPin(a, 'D11', 0);
% writeDigitalPin(a, 'D10', 0);
% writeDigitalPin(a, 'D8', 0);
% writeDigitalPin(a, 'D7', 0);
% writeDigitalPin(a, 'D6', 0);
% writeDigitalPin(a, 'D4', 0);
% writeDigitalPin(a, 'D3', 0);
% writeDigitalPin(a, 'D2', 0);
% pause(1)
% end