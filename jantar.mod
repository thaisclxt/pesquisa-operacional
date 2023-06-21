param peso_alfa;
param peso_beta;
param qtd_homens;
param qtd_mulheres;

set INIMIGOS;

var x1A >= 1, integer;
var x2A >= 1, integer;
var x1B >= 1, integer;
var x2B >= 1, integer;

# Função objetivo: maximizar o efeito do veneno
maximize Efeito: x1A + x2A + x1B + x2B;

# Restrições
subject to disp_alfa: 12 * x1A + 6 * x2A <= peso_alfa;
subject to disp_beta: 6 * x1B + 3 * x2B <= peso_beta;
subject to proporcao: 12 * x1A + 6 * x2A - 18 * x1B - 9 * x2B = 0;
subject to homens: x1A + x1B >= qtd_homens;
subject to mulheres: x2A + x2B >= qtd_mulheres;

solve;

printf "Efeito total do veneno: %g\n", Efeito;
printf "Quantidade de x1A: %g\n", x1A;
printf "Quantidade de x2A: %g\n", x2A;
printf "Quantidade de x1B: %g\n", x1B;
printf "Quantidade de x2B: %g\n", x2B;

end;
