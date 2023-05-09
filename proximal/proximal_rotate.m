function R = proximal_rotate(I, rotation_angle)
    % =========================================================================
    % Roteste imaginea alb-negru I de dimensiune m x n cu unghiul
    % rotation_angle, aplicând Interpolare Proximala.
    % rotation_angle este exprimat în radiani.
    % =========================================================================

    % Obtinem dimensiunea imaginii.
    [m n nr_colors] = size(I);
    
    % Convertim imaginea de intrare la alb-negru, daca este cazul.
    if nr_colors > 1
        R = -1;
        return
    endif

    % Obs:
    % Atunci când se aplica o scalare, punctul (0, 0) al imaginii nu se va
    % deplasa.
    % În Octave, pixelii imaginilor sunt indexati de la 1 la n.
    % Daca se lucreaza în indici de la 1 la n si se inmultesc x si y cu s_x,
    % respectiv s_y,
    % atunci originea imaginii se va deplasa de la (1, 1) la (sx, sy)!
    % De aceea, trebuie lucrat cu indici în intervalul [0, n - 1].

    % Calculam cosinus si sinus de rotation_angle.
    c = cos(rotation_angle);
    s = sin(rotation_angle);

    % Initializam matricea finala.
    R = zeros(m, n);

    % Calculam matricea de transformare.
    T = [c -s; s c];

    % Inversam matricea de transformare, FOLOSIND doar functii predefinite!
    T = inv(T);

    % Parcurgem fiecare pixel din imagine.
    for y = 0 : m - 1
        for x = 0 : n - 1
            % Aplicam transformarea inversa asupra (x, y) si calculeaza x_p si
            % y_p din spatiul imaginii initiale.
            A = T * [x; y];
            x_p = A(1, 1);
            y_p = A(2, 1);

            % Trecem (xp, yp) din sistemul de coordonate [0, n - 1] în
            % sistemul de coordonate [1, n] pentru a aplica interpolarea.
            ++x_p;
            ++y_p;

            % Daca xp sau yp se afla în exteriorul imaginii, punem un pixel
            % negru si se trece mai departe.
            if x_p < 1 || x_p > n || y_p < 1 || y_p > m
              R(y + 1, x + 1) = 0;
              continue;
            endif

            % Aflam punctele ce înconjoara(xp, yp).            

            % Calculam coordonatele punctelor.
            x1 = floor(x_p);
            y1 = floor(y_p);
            x2 = floor(x_p) + 1;
            y2 = floor(y_p) + 1;

            % y2 nu trebuie sa depaseasca m
            if y1 == m
              --y1;
              --y2;
            endif

            % x2 nu trebuie sa depaseasca n
            if x1 == n
              --x1;
              --x2;
            endif
            % Calculam coeficientii de interpolare notati cu a
            a = proximal_coef(I, x1, y1, x2, y2);

            % Calculam valoarea interpolata a pixelului (x, y).
            R(y + 1, x + 1) = a(1) + a(2) * x_p + a(3) * y_p + a(4) * x_p * y_p;
        endfor
    endfor

    % Transforma matricea rezultata în uint8 pentru a fi o imagine valida.
    R = uint8(R);
endfunction
