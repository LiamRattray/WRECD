function y = mydiff(one, two)
%     [oneX, oneY] = size(one);
%     [twoX, twoY] = size(two);
%     X = min(oneX, twoY);
%     Y = min(oneY, twoY);
%     one = imresize(one, [X,Y]);
%     two = imresize(two, [X,Y]);
%     dist = one - two;
%     absolute = abs(dist);
%     y = sum(absolute(:));

    s = one-two;
    ssd = sum(s(:).^2);
    y = ssd
