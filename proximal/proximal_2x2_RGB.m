function out = proximal_2x2_RGB(img, STEP = 0.1)
    % =========================================================================
    % Aplica Interpolare Proximala pe imaginea 2 x 2 definita img cu puncte
    % intermediare echidistante.
    % img este o imagine colorata RGB -Red, Green, Blue.
    % =========================================================================

    % Extragem canalul rosu al imaginii.
    r = img(:, :, 1);

    % Extragem canalul verde al imaginii.
    g = img(:, :, 2); 

    % Extragem canalul albastru al imaginii.
    b = img(:, :, 3);

    % Aplicam functia proximal pe cele 3 canale ale imaginii.
    r = proximal_2x2(r, STEP);
    g = proximal_2x2(g, STEP);
    b = proximal_2x2(b, STEP);

    % Formam imaginea finala concatenand cele 3 canale de culori.
    out = cat(3, r, g, b);
endfunction
