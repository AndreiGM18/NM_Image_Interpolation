function out = proximal_2x2(f, STEP = 0.1)
    % =========================================================================
    % Aplica Interpolare Proximala pe imaginea 2 x 2 f cu puncte intermediare
    % echidistante.
    % f are valori cunoscute în punctele (1, 1), (1, 2), (2, 1) si (2, 2).
    % Parametrii:
    % - f = imaginea ce se va interpola;
    % - STEP = distanta dintre doua puncte succesive.
    % =========================================================================
    
    % Definim coordonatele x si y ale punctelor intermediare.
    x_int = 1 : STEP : 2;
    y_int = 1 : STEP : 2;
    
    % Aflam numarul de puncte.
    n = length(x_int);

    % Cele 4 puncte incadratoare vor fi aceleasi pentru toate punctele din
    % interior.
     x1 = y1 = 1;
     x2 = y2 = 2;
    
    % Initialiazam rezultatul cu o matrice nula n x n.
    out = zeros(n);
    % Parcurgem fiecare pixel din imaginea finala.
    for i = 1 : n
        for j = 1 : n
           % Aflam cel mai apropiat pixel din imaginea initiala si calculam
           % pixelul din imaginea finala.
           if i < round(n / 2)
             if j < round (n / 2)
               out(i, j) = f(x1, y1);
             else
               out(i, j) = f(x1, y2);
             endif
           else
             if j < round(n / 2)
               out(i, j) = f(x2, y1);
             else
               out(i, j) = f(x2, y2);
             endif
           endif
        endfor
    endfor

endfunction