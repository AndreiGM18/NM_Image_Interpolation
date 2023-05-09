function r = fxy(f, x, y)
    % =========================================================================
    % Aproximeaza derivata fata de x si y a lui f in punctul (x, y).
    % =========================================================================
    
    [m n] = size(f);
    
    if (x + 1) > n || (x - 1) < 1 || (y + 1) > m || (y - 1) < 1
      r = 0;
      return;
    endif
    
    r = (f(y - 1, x - 1) + f(y + 1, x + 1) 
        - f(y - 1, x + 1) - f(y + 1, x - 1))/4;
    
endfunction