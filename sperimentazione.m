function sperimentazione(x, N)
    disp('Sperimentazione..');

    d_max = 50; % grado max del pol interpolante
    gradi = 1: d_max;


    tempi_DLP = zeros(size(gradi));
    tempi_DLP2 = zeros(size(gradi));
    lebesgue_vals = zeros(size(gradi));
    

    for d = gradi
        
        %misurazione tempo per DLP
        tic;
        dlp = DLP(x, d);
        tempi_DLP(d) = toc;

        %misurazione tempo per DLP2
        tic; 
        dlp2 = DLP2(x, d);
        tempi_DLP2(d) = toc;


        % Calcolo della costante di di Lebesgue per il metodo piu efficente
        if tempi_DLP2(d) < tempi_DLP(d)
            lebesgue_vals(d) = max(leb_con(dlp, x), [], 'all'); 
        else
            lebesgue_vals(d) = max(leb_con(dlp2, x), [], 'all');
        end

    end

    % Grafico dei tempi computazionali 
    figure;
    plot(gradi, tempi_DLP, 'r', gradi, tempi_DLP2, 'b', 'LineWidth', 2);
    legend('DLP', 'DLP2', 'Location', 'northwest');
    title('Tempi computazionali al variare di grado d');
    xlabel('Grado del polinomio d');
    ylabel('Tempo(s)');
    grid on;

    % Grafico della costante di lebsuge in scala semilogritmica
    figure;
    semilogy(gradi, lebesgue_vals, 'g', 'LineWidth', 1.5);
    title('Costante di Lebesgue per nodi di Leja');
    xlabel('Grado del polinomio d');
    ylabel('Costante di Lebesgue ');
    grid on;

    












