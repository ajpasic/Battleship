function RandLight(pins,ard)
%Name:  Daniel Dorali
%Last Updated:  04/10/19
numofleds = randi([1,9],1);
sequencer = rand(3);
disp('The number of LEDS that have been randomly selected are:')
disp(numofleds)
for n = 1:numofleds
    [~,mincol] = min(min(sequencer));
    [~,minrow] = min(sequencer(:,mincol));
        %finds exact location of the minimum number
    pinlocation = pins(minrow,mincol);
    writeDigitalPin(ard,pinlocation,1)
    sequencer(minrow,mincol) = 100;
end

end

