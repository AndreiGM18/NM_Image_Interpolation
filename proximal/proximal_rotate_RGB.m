function out = proximal_rotate_RGB(img, rotation_angle)
    % =========================================================================
    % Aplica Interpolarea Proximala pentru a roti o imagine RGB cu un unghi dat.
    % =========================================================================
    
    % Extragem canalul rosu al imaginii.
    r = img(:, :, 1);

    % Extragem canalul verde al imaginii.
    g = img(:, :, 2);

    % Extragem canalul albastru al imaginii.
    b = img(:, :, 3);

    % Aplicam rotatia pe fiecare canal al imaginii.
    r = proximal_rotate(r, rotation_angle);
    g = proximal_rotate(g, rotation_angle);
    b = proximal_rotate(b, rotation_angle);

    % Formam imaginea finala concatenând cele 3 canale de culori.
    out = cat(3, r, g, b);
endfunction