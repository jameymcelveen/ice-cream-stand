function ice_cream_shop()
    % Project: Ice Cream Shop CLI
    % Author: Jamey McElveen

    clear; clc;

    %% --- Main Program ---
    flavors = {'Vanilla', 'Chocolate', 'Strawberry', 'Mint'}; 
    prices = [3.00, 3.50, 3.25, 4.00]; % Price per scoop
    all_orders = []; % To store quantity and price

    keep_ordering = true; % <SM:BOOL:LASTNAME>

    fprintf('\n-- 🍦 Welcome to the Ice Cream Shop 🍦 --\n');
    fprintf('\n-- ✏️  What can I get for you? --\n\n');
    % <SM:WHILE:LASTNAME>
    while keep_ordering
        
        for i = 1:length(flavors)
            fprintf('%d. %s ($%.2f)\n', i, flavors{i}, prices(i));
        end
        
        % Get selection
        choice = input('Select a flavor (1-4): ');
        % <SM:IF:LASTNAME>
        if choice < 1 || choice > 4
            fprintf('Invalid choice. Defaulting to Vanilla.\n');
            choice = 1;
        end
        
        num_scoops = input('How many scoops? ');
        
        % Add to our data matrix [FlavorIndex, Scoops, BasePrice]
        % <SM:AUG:LASTNAME> (Array Augmentation)
        all_orders = [all_orders; choice, num_scoops, prices(choice)];
        
        % Ask to continue
        cont = input('Would you like another? (y/n): ', 's');
        % <SM:STR:LASTNAME> (String comparison)
        if strcmpi(cont, 'n')
            keep_ordering = false;
        elseif strcmpi(cont, 'y')
            fprintf('\n-- ✏️  What else would you like? --\n\n');
        end
    end

    %% --- Data Processing & Receipt ---
    % Function 1: Search/Filter (Find orders with more than 2 scoops)
    % <SM:FILTER:LASTNAME>
    large_orders = filterLargeOrders(all_orders);

    % Function 2: Analysis (Calculate Total)
    % <SM:ANALYSIS:LASTNAME>
    total_bill = calculateTotal(all_orders);

    % Function 3: Visualization (Show flavor popularity)
    % <SM:VISUAL:LASTNAME>
    visualizeOrders(all_orders, flavors);
     
    % Final Receipt Output
    fprintf('------------------------------\n');
    fprintf('---  🍦 YOUR RECEIPT 🍦  ---\n');
    fprintf('------------------------------\n');
    % <SM:FOR:LASTNAME>
    for j = 1:size(all_orders, 1)
        f_idx = all_orders(j, 1);
        scoops = all_orders(j, 2);
        cost = scoops * all_orders(j, 3);
        fprintf('%d scoops of %s: $%.2f\n', scoops, flavors{f_idx}, cost);
    end
    fprintf('------------------------------\n');
    fprintf('-- 💖 THANKS & ENJOY 💖 --\n');
    fprintf('------------------------------\n');
    fprintf('TOTAL: $%.2f\n', total_bill);
    fprintf('------------------------------\n');

end

%% --- Required Functions ---

function filtered = filterLargeOrders(data)
    % Returns only rows where scoops (column 2) > 2
    % <SM:REF:LASTNAME> (Array Referencing/Slicing)
    indices = data(:, 2) > 2;
    filtered = data(indices, :);
end

function total = calculateTotal(data)
    % Calculates total cost: sum of (scoops * price)
    % Vectorized operation (The MATLAB way)
    scoops = data(:, 2);
    unit_prices = data(:, 3);
    total = sum(scoops .* unit_prices); 
end

function visualizeOrders(data, flavor_names)
    % Create a bar chart of how many scoops of each flavor were ordered
    counts = zeros(1, length(flavor_names));
    for i = 1:length(flavor_names)
        % Sum scoops where flavor index matches i
        counts(i) = sum(data(data(:,1) == i, 2));
    end
    
    figure;
    bar(counts);
    set(gca, 'XTickLabel', flavor_names);
    title('Scoops Ordered per Flavor');
    ylabel('Total Scoops');
end