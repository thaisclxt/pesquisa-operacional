set INIMIGOS;
set VENENOS;

param eliminar{INIMIGOS};
param disponibilidade{VENENOS};
param proporcao{VENENOS};

var x1A >= 1, integer;
var x2A >= 1, integer;
var x1B >= 1, integer;
var x2B >= 1, integer;

# Função objetivo: maximizar o efeito do veneno
maximize Efeito: x1A + x2A + x1B + x2B;

# Restrições
subject to disp_alfa: 12 * x1A + 6 * x2A <= disponibilidade["alfa"];
subject to disp_beta: 6 * x1B + 3 * x2B <= disponibilidade["beta"];
subject to paladar: (12 * proporcao["beta"]) * x1A + (6 * proporcao["beta"]) * x2A - (6 * proporcao["alfa"]) * x1B - (3 * proporcao["alfa"]) * x2B = 0;
subject to homens: x1A + x1B >= eliminar["homens"];
subject to mulheres: x2A + x2B >= eliminar["mulheres"];

solve;

printf "Efeito total do veneno: %g\n", Efeito;
printf "Quantidade de x1A: %g\n", x1A;
printf "Quantidade de x2A: %g\n", x2A;
printf "Quantidade de x1B: %g\n", x1B;
printf "Quantidade de x2B: %g\n", x2B;

end;
