function [Ix, Iy, Ixy] = precalc_d(I)
    % =========================================================================
    % Prealculeaza matricile Ix, Iy si Ixy ce contin derivatele dx, dy, dxy ale 
    % imaginii I pentru fiecare pixel al acesteia.
    % =========================================================================

    % Obtinem dimensiunea imaginii.
    [m n nr_colors] = size(I);
    
    % Tranformam matricea I in double.
    I = double(I);

    % Calculam matricile cu derivate fata de x Ix, y Iy si xy Ixy.
    for i = 1 : m
      for j = 1 : n
        Ix(i, j) = fx(I, j, i);
        Iy(i, j) = fy(I, j, i);
        Ixy(i, j) = fxy(I, j, i);
      endfor
    endfor

endfunction
