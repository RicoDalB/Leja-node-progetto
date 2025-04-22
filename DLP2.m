function dlp2 = DLP2(x, d)

    x = x(:);
    V = cos(acos(x) * (0:d));
    [~, ~, P] = lu(V, 'vector');
    dlp2 = x(P(1:d+1));
end


