# input:
# 5 3
# 0 1
# 2 3
# 0 4

# output: 6

print('moon')

n=5
p=3
pairs =[
[0, 1],
[2, 3],
[0, 4]
]


def group_by_country(n:int, pairs: list[list]) -> list(set):
    """
    Group people in the pairs by countries. 
    Returns a list where index represents a country, value represents its population.
    
    Parameters:
        n: number of people. Each man has a inique ID. 
        pairs: List fellow citizens.
    """

    people = set(range(n))
    countries =[]

    while len(pairs) >0 :
        countries.append(set())
        country = countries[-1]
        add_pair_to_country(pairs[0])
        del pairs[0]
        move_pairs_to_country(pairs, country)

    return []

def move_pairs_to_country(pairs, country):
    """
    Function modifies both pairs array and country set.
    Each pair where at least one member belongs to the country should be moved to the country.
    Moving  means deleting a pair from the pairs list and adding members of the pair to the country.
    """
    pass

def add_more_countries(people:set, countries: list[set]) -> list[set] :
    """
    for each persons, who are not citizens of any country,
    add a new country to the countries list.
    """
    return countries


    

def journeyToMoon(n:int, pairs: list) -> int:
    """
    returns an integer that represents the number of valid pairs that can be formed.
    
    parameters:
        n: an integer that denotes the number of astronauts
        pairs:  a 2D array where each element  is an integer array 
                that represents the ID's of two astronauts from the same country
    
    """
    # Group people in the pairs by countries.
    population = group_by_country(n, pairs)


    return (n*n - sum(p * p for p in population))/2

    