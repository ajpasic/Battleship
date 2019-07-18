function [] = RandLight(ard,pins,board)
%Function created in order to light up a random number of LEDs(1-9) in
%random locations on your breadboard. The function should diplay the
%randomly selected number of LEDs each time it runs in the command window.
%   Name: Shereen Enan
%   Last Update: 4/19/2019
%Inputs:
%   ard: Input will be the already defined arduino() object.
%   pins: will be the pins on your breadboard you are coding to light up.
%   board: will be the random matrix created being used to match the
%   breadboard to make the pins light up 
%Output:
%    No outputs will be given for this user defined function

LEDs=randi(9);
rand_vector=randperm(9);
rand_matrix=[rand_vector(1:3);rand_vector(4:6);rand_vector(7:9)];

for e=1:1:LEDs
    for r=1:3
        for c=1:3
            if rand_matrix(r,c)==e
                board(r,c)=1;
                UpdateBoard(ard,pins(:,:),board)
            end
        end
    end
end

disp(['The number of randomly selected LEDs is ',num2str(LEDs),' LEDs.'])


