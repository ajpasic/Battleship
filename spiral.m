clc, clear

% initialize arduino
a = arduino();

% define pins
Adi_pins = ["D12", "D11", "D10";
            "D8", "D7", "D6";
            "D4", "D3", "D2"]; % Adi's configuration
    
Vincent_pins = ["D2", "D3", "D4";
                "D7", "D8", "D9";
                "D11", "D12", "D13"]; % Vincent's configuration
            
pins = Adi_pins;

dirs = ['u', 'l', 'd', 'r']; % possible directions (base point is bottom left)
offset = [-1, 0; % change in row and column
          0, -1;
          1, 0;
          0, 1];
      
corner = [3, 3; % locations of starting pins
          1, 3;
          1, 1;
          3, 1];

startPoint = []; % initialize starting location

while isempty(intersect(startPoint, dirs)) % while dirs does not contain startPoint
    startPoint = input('Pick which direction you want to go: ', 's');
    if isempty(intersect(startPoint, dirs))
        disp('please choose a valid starting point');
    end
end 

currentPosition = corner(dirs == startPoint, :); % determine starting pin

% calculate circshift offset
index = find(dirs == startPoint);
shift = mod((5 - index), 4);

offset = circshift(offset, shift); % shift offset vector

% start in the corner determined by user input
writeDigitalPin(a, pins(currentPosition(1), currentPosition(2)), 1);
pause(1)

for n = 1:1:10 % loop around n times
    for i = 1:1:4 % cycle through all directions
        % get future pin position
        newX = currentPosition(1) + offset(i, 1);
        newY = currentPosition(2) + offset(i, 2);
        while newX <= 3 && newX >= 1 && newY <= 3 && newY >= 1 % check if new position is within bounds
            writeDigitalPin(a, pins(currentPosition(1), currentPosition(2)), 0); % erase old pin
            currentPosition(1) = newX;
            currentPosition(2) = newY;
            writeDigitalPin(a, pins(currentPosition(1), currentPosition(2)), 1); % draw new pin
            pause(1);
            % get future pin position
l            newX = currentPosition(1) + offset(i, 1);
            newY = currentPosition(2) + offset(i, 2);
        end
    end
end

clear, clc % clear everything