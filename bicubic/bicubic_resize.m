function R = bicubic_resize(I, p, q)
    % =========================================================================
    % Se scaleaza imaginea folosind algoritmul de Interpolare Bicubic?.
    % Transforma imaginea I din dimensiune m x n in dimensiune p x q.
    % =========================================================================

    % Obtinem dimensiunea imaginii.
    [m n nr_colors] = size(I);

    % Transformam I in double.
    I = double(I);

    % Initializam matricea finala drept o matrice nula.
    R = zeros(p, q);

    % Daca imaginea e alb negru, ignora
    if nr_colors > 1
        R = -1;
        return
    endif

    % Obs:
    % Atunci cand se aplica o scalare, punctul (0, 0) al imaginii nu se va deplasa.
    % In Octave, pixelii imaginilor sunt indexati de la 1 la n.
    % Daca se lucreaza in indici de la 1 la n si se inmulteste x si y cu s_x
    % respectiv s_y, atunci originea imaginii se va deplasa de la (1, 1) la (sx, sy)!
    % De aceea, trebuie lucrat cu indici in intervalul [0, n - 1]!

    % Calculam factorii de scalare
    % Obs: Daca se lucreaza cu indici in intervalul [0, n - 1], ultimul pixel
    % al imaginii se va deplasa de la (m - 1, n - 1) la (p, q).
    % s_x nu va fi q ./ n
    s_x = (q - 1) / (n - 1);
    s_y = (p - 1) / (m - 1);

    % Definim matricea de transformare pentru redimensionare.
    T = [s_x 0; 0 s_y];

    % Calculam inversa transformarii.
    T = inv(T);

    % Precalculam derivatele.
    [Ix Iy Ixy] = precalc_d(I);

    % Parcurgem fiecare pixel din imagine.
    for y = 0 : p - 1
        for x = 0 : q - 1
            % Aplicam transformarea inversa asupra (x, y) si calculeaza x_p si y_p
            % din spatiul imaginii initiale.
            A = T * [x; y];
            x_p = A(1, 1);
            y_p = A(2, 1);

            % Trecem (xp, yp) din sistemul de coordonate 0, n - 1 in
            % sistemul de coordonate 1, n pentru a aplica interpolarea.
            ++x_p;
            ++y_p;

            % Gasim cele 4 puncte ce inconjoara punctul x, y

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

            % Calculam coeficientii de interpolare A.
            A = bicubic_coef(I, Ix, Iy, Ixy, x1, y1, x2, y2);

            % Trecem coordonatele (xp, yp) in patratul unitate, scazand
            % (x1, y1).
            x_p -= x1;
            y_p -= y1;

            % Calculam valoarea interpolata a pixelului (x, y).
            % Obs: Pentru scrierea in imagine, x si y sunt in coordonate de
            % la 0 la n - 1 si trebuie aduse in coordonate de la 1 la n.
            R(y + 1, x + 1) = [1 x_p x_p^2 x_p^3] * A * [1; y_p; y_p^2; y_p^3];
        endfor
    endfor

    % Transformam matricea rezultata în uint8 pentru a fi o imagine valida.
    R = uint8(R);
endfunction





