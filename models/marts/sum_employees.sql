select
    sum(nb_employees) as sum_employees
from
    {{source ('restaurants','restaurants')}}