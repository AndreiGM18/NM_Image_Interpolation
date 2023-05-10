**Nume: Mitran Andrei-Gabriel**
**Grupa: 313CA**

## Interpolare aplicata pe imagini

### Descriere:

* Implemeteaza doua metode de interpolare aplicate pe imagini:
	- proximala (pentru rotire si redimensionare);
	- bicubica (pentru redimensionare).

1. Interpolare Proximala (se foloseste de cele mai apropiate puncte):
* proximal_2x2: aplica interpolarea pe o imagine alb-negru 2 x 2 cu puncte
		    intermediare echidistante;
* proximal_2x2_RGB: aplica interpolarea pe o imagine colorata (RGB) 2 x 2 cu
			  puncte intermediare echidistante;
* proximal_resize: redimensioneaza o imagine alb-negru de dimensiune m x n in
			 p x q;
* proximal_resize_RGB: redimensioneaza o imagine colorata (RGB) de dimensiune
			     m x n in p x q;
* proximal_rotate: roteste o imagine alb-negru de dimensiune m x n cu unghiul
    			 rotation_angle (exprimat in radiani);
* proximal_rotate: roteste o imagine colorata (RGB) de dimensiune m x n cu
			 unghiul rotation_angle (exprimat in radiani).

2. Interpolare Bicubica (se foloseste de functii spline cubice pe axele de
coordonate):
* fx / fy / fxy: aproximeaza derivata fata de x / y / x si y a lui f in
		     punctul (x, y);
* precalc_d: prealculeaza matricile Ix, Iy si Ixy ce contin derivatele dx, dy,
		 dxy ale unei imagini I pentru fiecare pixel al acesteia;
* bicubic_coef: calculeaza coeficientii de interpolare bicubica pentru 4
		    puncte alaturate
* bicubic_resize: redimensioneaza o imagine alb-negru de dimensiune m x n in
			p x q;
* bicubic_resize_RGB: redimensioneaza o imagine colorata (RGB) de dimensiune
			     m x n in p x q.
