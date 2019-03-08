function y = support_cmp(one, two)

    s = one-two;
    ssd = sum(s(:).^2);
    y = ssd;