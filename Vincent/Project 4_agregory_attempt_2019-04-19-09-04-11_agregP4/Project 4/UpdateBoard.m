function [] = UpdateBoard(a,board)
pins = ["D12","D11","D10";"D9","D8","D7";"D6","D5","D4"];
for i = 1:9
    writeDigitalPin(a,pins(i),board(i))
end
end
        
    