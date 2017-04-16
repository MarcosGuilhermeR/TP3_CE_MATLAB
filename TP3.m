
clc;

global N; %Número de indivíduos

N = 100;


    population = generate_initial_population (N);
    
    hold on;
for i=1: 1000   
    population = evaluate_population (population);
    
    population = generate_new_population (population, N);
    

 if (mod(i,100) == 0)
    %    plot(population)
    x = zeros(1,N);
    y = zeros(1,N);
    
    for j=1: N
        x(i) = population(j).y1;
        y(i) = population(j).y2;
    end
    
  plot(x, y, '*') 
 end
end


for i=1: N  
   disp(population(i).x)
end


