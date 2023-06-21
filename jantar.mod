set VENENOS;

param disponibilidade_alfa;
param disponibilidade_beta;
param quantidade_homens;
param quantidade_mulheres;

param proporcao_veneno{VENENOS};

var x1A >= 1, integer;
var x2A >= 1, integer;
var x1B >= 1, integer;
var x2B >= 1, integer;

# Função objetivo: maximizar o efeito do veneno
maximize Efeito: x1A + x2A + x1B + x2B;

# Restrições
subject to disp_alfa: 12 * x1A + 6 * x2A <= disponibilidade_alfa;
subject to disp_beta: 6 * x1B + 3 * x2B <= disponibilidade_beta;
subject to paladar: (12 * proporcao_veneno["beta"]) * x1A + (6 * proporcao_veneno["beta"]) * x2A - (6 * proporcao_veneno["alfa"]) * x1B - (3 * proporcao_veneno["alfa"]) * x2B = 0;
subject to homens: x1A + x1B >= quantidade_homens;
subject to mulheres: x2A + x2B >= quantidade_mulheres;

solve;

printf "Efeito total do veneno: %g\n", Efeito;
printf "Quantidade de x1A: %g\n", x1A;
printf "Quantidade de x2A: %g\n", x2A;
printf "Quantidade de x1B: %g\n", x1B;
printf "Quantidade de x2B: %g\n", x2B;

end;
