function r = fy(f, x, y)
    % =========================================================================
    % Aproximeaza derivata fata de y a lui f in punctul (x, y).
    % =========================================================================
    
    [m n] = size(f);
    
    if (y + 1) > m || (y - 1) < 1
      r = 0;
      return;
    endif
    
    r = (f(y + 1, x) - f(y - 1, x))/2;
    
endfunction