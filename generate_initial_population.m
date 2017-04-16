function [ population_r ] = generate_initial_population( N)
%GENERATE_INITIAL_POPULATION Summary of this function goes here
%   Detailed explanation goes here
    
    population_r(1,N) = Individual();
    
     for i=1 : N
            n = randi(34)-17;
            population_r(i).x = n;
     end
     
     
end

