function z = GetKey()
k = waitforbuttonpress;
z = double(get(gcf,'CurrentCharacter'));
end