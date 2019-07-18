function [] = RandLight(ARDUINO,BOARD,PINS)

for x=1:1:5
    
    
        a=rand(1,9)>.3;
        b=reshape(a,3,3);
        BOARD=b;
        c=sum(sum(BOARD));
        UpdateBoard(ARDUINO,BOARD,PINS)
        fprintf('\n\nThe number of pins being lit is %d',c);
        pause(5)
        BOARD=[0,0,0;
               0,0,0;
               0,0,0;];
        UpdateBoard(ARDUINO,BOARD,PINS);
        pause(5)
        
        
           
    
    end
    
end
    


