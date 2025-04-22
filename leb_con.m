function L = leb_con(z, x)

    if isempty(z) || isempty(x)
        error('Input non valido: z e x non possono essere vuoti.');
    end

    z = z(:)';
    x = x(:); 

    n = length(z);
    lebesgue_vals = zeros(size(x));

    for i = 1:n
        lagrange_term = prod((x-z([1:i-1, i+1:n])) ./ (z(i) - z([1:i-1, i+1:n])), 2);
        lebesgue_vals = lebesgue_vals + abs(lagrange_term);
    end

    L = max(lebesgue_vals);
end

