set INIMIGOS;
set VENENOS;

param eliminar{INIMIGOS};
param disponibilidade{VENENOS};
param proporcao{VENENOS};
param eficacia{INIMIGOS, VENENOS};

var x1A >= 1, integer;
var x2A >= 1, integer;
var x1B >= 1, integer;
var x2B >= 1, integer;

# Função objetivo: maximizar o efeito do veneno
maximize Efeito: x1A + x2A + x1B + x2B;

# Restrição de disponibilidade de veneno
subject to disp_alfa: eficacia["homens", "alfa"] * x1A + eficacia["mulheres", "alfa"] * x2A <= disponibilidade["alfa"];
subject to disp_beta: eficacia["homens", "beta"] * x1B + eficacia["mulheres", "beta"] * x2B <= disponibilidade["beta"];

# Restrição devida ao paladar
subject to paladar:
    (eficacia["homens", "alfa"] * proporcao["beta"]) * x1A
    + (eficacia["mulheres", "alfa"] * proporcao["beta"]) * x2A
    - (eficacia["homens", "beta"] * proporcao["alfa"]) * x1B
    - (eficacia["mulheres", "beta"] * proporcao["alfa"]) * x2B = 0;

# Restrição de demanda
subject to homens: x1A + x1B >= eliminar["homens"];
subject to mulheres: x2A + x2B >= eliminar["mulheres"];

solve;

printf "Efeito total do veneno: %g\n", Efeito;

end;
