function [] = UpdateBoard(a,board)
%David Mitchell
%Purpose: Updates LEDs to reflect values in the matrix 
pins = ["D12","D11","D10";"D9","D8","D7";"D6","D5","D4"];
for i = 1:9
    writeDigitalPin(a,pins(i),board(i))
end

end

