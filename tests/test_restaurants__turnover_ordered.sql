{% set columns_to_compare = '
    restaurant_identifier::number
    , name::string
    , address::string
    , turnover::number'
%}

{{ is_same_table('restaurants__turnover_ordered', 'expect_restaurants__turnover_ordered', columns_to_compare) }} 