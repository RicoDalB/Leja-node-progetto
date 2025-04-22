function p_eval = chebyshev(x_nodes, f_nodes, x_eval)
    n = length(x_nodes);
    
    V = cos((0:n-1)' .* acos(x_nodes(:).'));
    
    c = V \ f_nodes(:);
    
    V_eval = cos((0:n-1)' .* acos(x_eval(:).'));
    p_eval = (V_eval' * c);
    
    p_eval = p_eval(:);
end



