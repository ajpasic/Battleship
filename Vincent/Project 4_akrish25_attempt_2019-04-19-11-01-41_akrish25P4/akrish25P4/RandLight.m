function RL=RandLight(a,pins)
board36=randi([0, 1], [3,3]);
[row36 col36]=size(board36);
count=0;

for r36=1:row36
     for c36=1:col36
         if board36(r36,c36)== 0
          writeDigitalPin(a,pins(r36,c36),0)
         else
          writeDigitalPin(a,pins(r36,c36),1)
          count=count+1;
         end
     end
end

disp('Number of LED Lights on in this iteration:')
disp(count)
end