
function[raf]=RandLight(a)
pins = ["D12","D11","D10";"D9","D8","D7";"D6","D5","D4"];
r = randi(length(pins));
for i = 1:randi(length(pins))
board = randi([0 1],3,3);
nm = find(board==1);
[LEDsLit,~]=size(nm)
UpdateBoard(a,board);
end
end