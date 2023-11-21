from fuzzywuzzy import process

def custom_score(string):
    x = process.extractOne(string, dishes_df.NAME, score_cutoff=60)

    if x is not None:
        return x[0]
    else:
        return None

def model(dbt, session):

    dbt.config(
        materialized = "table",
        packages = ["fuzzywuzzy"]
    )

    dishes_df = dbt.ref("base_dishes").to_pandas()

    fuzzy_order_df = dbt.ref("stg_fuzzy_orders_flatten").to_pandas()

    return fuzzy_order_df.apply(custom_score)