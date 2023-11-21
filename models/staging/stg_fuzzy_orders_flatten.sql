select
    fo.created_at as created_at,
    f.value as dishes_names
from    
    fuzzy_orders as fo, lateral flatten(input => parse_json(fo.dishes_names)) f