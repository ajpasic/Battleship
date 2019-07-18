function [] = UpdateBoard(ARDUINO,BOARD,PINS)

[RPINS,CPINS]= size(PINS);
for x=1:1:RPINS
    for y=1:1:CPINS
            
        writeDigitalPin(ARDUINO,PINS(x,y),BOARD(x,y));
            
        end
        
    end
    
end
        
        

