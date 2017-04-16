function population = generate_new_population (population, N)

    n = size(population);
    n = n(2);
    %pop_size = 0;
    
    for i=1 : n
       ind_noise = difference_and_mutation (population, i);
       ind_noise = evaluate_individual(ind_noise);
       
       population = select_better_individual(population, i, ind_noise);
       
       
    end
    
    population = population(1:N);
       
    ix = randperm(n);
    population = population(ix);

end

function population = select_better_individual (population, i, ind_noise)
    ind_target = population(i);
    
    if      (ind_noise.y1 <= ind_target.y1 && ind_noise.y2 < ind_target.y2) || (ind_noise.y1 < ind_target.y1  && ind_noise.y2 <= ind_target.y2)
       population(i) = ind_noise;
    elseif  (ind_target.y1 <= ind_noise.y1 && ind_target.y2 < ind_noise.y2) || (ind_target.y1 < ind_noise.y1  && ind_target.y2 <= ind_noise.y2)   
       population(i) = ind_target;
    else
        
        noise_vet(1,1) = Individual();
        noise_vet(1) = ind_noise;
       population = [population, noise_vet];
    end
end

function ind_noise = difference_and_mutation (population, i)

    n = size(population);
    n = n(2);
    
    
    p = randperm(n);
    while (p(1) == i || p(2) == i || p(3) == i)
        p = randperm(n);
    end
    
    ind1 = population(p(1));
    ind2 = population(p(2));
    ind3 = population(p(3));
    
    vet_difference_pond = 0.5*(ind1.x - ind2.x);
    
    ind_noise = Individual();
    ind_noise.x = vet_difference_pond + ind3.x;
    
end