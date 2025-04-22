clc; clear; close all;

disp('Generazione della mesh e impostazione dei parametri...')
N = 100000;
x = linspace(-1,1,N);
d = 10;

disp('Calcolo dei nodi di Leja con DLP..');
dlp = DLP(x,d);
disp('Nodi di leja calcolati con DLP');
disp(dlp'); 

disp('Calcolo dei nodi di Leja con DLP2..');
dlp2 = DLP2(x,d);
disp('Nodi di leja calcolati con DLP2');
disp(dlp2');

disp('Calcolo della costante di Lebesgue per DLP..');
Lebesgue_DLP = leb_con(dlp, x);
disp(['Costante di Lebesgue per DLP: ', num2str(Lebesgue_DLP)]);

disp('Calcolo della costante di Lebesgue per DLP2..');
Lebesgue_DLP2 = leb_con(dlp2, x);
disp(['Costante di Lebesgue per DLP: ', num2str(Lebesgue_DLP2)]);


sperimentazione(x, N);

interpolazione(x, N);