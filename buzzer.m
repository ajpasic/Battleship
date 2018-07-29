clc, clear
ard = arduino();

%% star wars song
c = 261;
d = 294;
e = 329;
f = 349;
g = 391;
gS = 415;
a = 440;
aS = 455;
b = 466;
cH = 523;
cSH = 554;
dH = 587;
dSH = 622;
eH = 659;
fH = 698;
fSH = 740;
gH = 784;
gSH = 830;
aH = 880;
 
% Play first section
pauseTone(ard, 'D5', a, 500/1000);
pauseTone(ard, 'D5', a, 500/1000);    
pauseTone(ard, 'D5', a, 500/1000);
pauseTone(ard, 'D5', f, 350/1000);
pauseTone(ard, 'D5', cH, 150/1000);  
pauseTone(ard, 'D5', a, 500/1000);
pauseTone(ard, 'D5', f, 350/1000);
pauseTone(ard, 'D5', cH, 150/1000);
pauseTone(ard, 'D5', a, 650/1000);

pause(500/1000);

pauseTone(ard, 'D5', eH, 500/1000);
pauseTone(ard, 'D5', eH, 500/1000);
pauseTone(ard, 'D5', eH, 500/1000);  
pauseTone(ard, 'D5', fH, 350/1000);
pauseTone(ard, 'D5', cH, 150/1000);
pauseTone(ard, 'D5', gS, 500/1000);
pauseTone(ard, 'D5', f, 350/1000);
pauseTone(ard, 'D5', cH, 150/1000);
pauseTone(ard, 'D5', a, 650/1000);

pause(500/1000);

% Play second section
pauseTone(ard, 'D5', aH, 500/1000);
pauseTone(ard, 'D5', a, 300/1000);
pauseTone(ard, 'D5', a, 150/1000);
pauseTone(ard, 'D5', aH, 500/1000);
pauseTone(ard, 'D5', gSH, 325/1000);
pauseTone(ard, 'D5', gH, 175/1000);
pauseTone(ard, 'D5', fSH, 125/1000);
pauseTone(ard, 'D5', fH, 125/1000);    
pauseTone(ard, 'D5', fSH, 250/1000);

pause(325/1000);

pauseTone(ard, 'D5', aS, 250/1000);
pauseTone(ard, 'D5', dSH, 500/1000);
pauseTone(ard, 'D5', dH, 325/1000);  
pauseTone(ard, 'D5', cSH, 175/1000);  
pauseTone(ard, 'D5', cH, 125/1000);  
pauseTone(ard, 'D5', b, 125/1000);  
pauseTone(ard, 'D5', cH, 250/1000);  

pause(350/1000);

% Variant 1
pauseTone(ard, 'D5', f, 250/1000);  
pauseTone(ard, 'D5', gS, 500/1000);  
pauseTone(ard, 'D5', f, 350/1000);  
pauseTone(ard, 'D5', a, 125/1000);
pauseTone(ard, 'D5', cH, 500/1000);
pauseTone(ard, 'D5', a, 375/1000);  
pauseTone(ard, 'D5', cH, 125/1000);
pauseTone(ard, 'D5', eH, 650/1000);

pause(500/1000);

% Repeat second section
pauseTone(ard, 'D5', aH, 500/1000);
pauseTone(ard, 'D5', a, 300/1000);
pauseTone(ard, 'D5', a, 150/1000);
pauseTone(ard, 'D5', aH, 500/1000);
pauseTone(ard, 'D5', gSH, 325/1000);
pauseTone(ard, 'D5', gH, 175/1000);
pauseTone(ard, 'D5', fSH, 125/1000);
pauseTone(ard, 'D5', fH, 125/1000);    
pauseTone(ard, 'D5', fSH, 250/1000);

pause(325/1000);

pauseTone(ard, 'D5', aS, 250/1000);
pauseTone(ard, 'D5', dSH, 500/1000);
pauseTone(ard, 'D5', dH, 325/1000);  
pauseTone(ard, 'D5', cSH, 175/1000);  
pauseTone(ard, 'D5', cH, 125/1000);  
pauseTone(ard, 'D5', b, 125/1000);  
pauseTone(ard, 'D5', cH, 250/1000);  

pause(350/1000);

% Variant 2
pauseTone(ard, 'D5', f, 250/1000);  
pauseTone(ard, 'D5', gS, 500/1000);  
pauseTone(ard, 'D5', f, 375/1000);  
pauseTone(ard, 'D5', cH, 125/1000);
pauseTone(ard, 'D5', a, 500/1000);  
pauseTone(ard, 'D5', f, 375/1000);  
pauseTone(ard, 'D5', cH, 125/1000);
pauseTone(ard, 'D5', a, 650/1000);  