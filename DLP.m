function dlp = DLP(x, d)

    if ~isvector(x) || ~isscalar(d) || d < 0 || round(d) ~= d || length(x) < d+1
        error('Input non valido. x vettore, d intero positivo, length(x) >= d+1.');
    end

    x = x(:);
    dlp = zeros(1, d+1);
    dlp(1) = x(1);
    
    for i = 2:d+1 
        [~, max_idx] = max(prod(abs(x - dlp(1:i-1)), 2));
        dlp(i) = x(max_idx);
    end
end



