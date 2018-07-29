clc, clear
k = waitforbuttonpress;
% 28 leftarrow
% 29 rightarrow
% 30 uparrow
% 31 downarrow
% 13 enter
% 27 escape
value = double(get(gcf,'CurrentCharacter'));
disp(value)