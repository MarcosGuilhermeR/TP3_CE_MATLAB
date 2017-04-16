function population = evaluate_population (population)

    n = size(population);
    
    for i=1: n(2)
        population(i) = evaluate_individual(population(i));
    end
    
end

