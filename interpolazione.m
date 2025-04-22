function interpolazione(x, N)
    disp('Interpolazione..');

    d_max = 50;
    gradi = 1:d_max;

    error_leja = zeros(size(gradi));
    error_equi = zeros(size(gradi));

    f = @(x) 1 ./ (x - 1.3);
    fx = f(x(:));

    for d = gradi

        tic;
        dlp_DLP = DLP(x, d);
        tempo_DLP = toc;
        
        tic;
        dlp_DLP2 = DLP2(x, d);
        tempo_DLP2 = toc;

        dlp_best = dlp_DLP;
        if tempo_DLP2 < tempo_DLP
            dlp_best = dlp_DLP2;
        end

        nodi_equi = linspace(-1, 1, d+1)';


        f_leja = f(dlp_best);  
        f_equi = f(nodi_equi);

        p_leja = chebyshev(dlp_best, f_leja, x);
        p_equi = chebyshev(nodi_equi, f_equi, x);

        error_leja(d) = max(abs(p_leja - fx));
        error_equi(d) = max(abs(p_equi - fx));
    end

    % grafico dell'errore massimo 
    figure;
    semilogy(gradi, error_leja, 'r', 'LineWidth', 2);
    hold on;
    semilogy(gradi, error_equi, 'b', 'LineWidth', 2);
    legend('Errore Leja', 'Errore equispaziato', 'Location', 'northwest');
    title('Errore massimo di interpolazione per nodi di Leja ed equispaziati');
    xlabel('Grado del polinomio d');
    ylabel('Errore massimo');
    grid on;
    hold off;
end
