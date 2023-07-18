from fuzzywuzzy import process

def model(dbt, session):
    dbt.config(
        materialized="table"
        , packages=["fuzzywuzzy"]
    )

    df_restaurants = dbt.ref("restaurants").to_pandas()

    def custom_scorer(string):
        x = process.extractOne(string, df_restaurants.NAME, score_cutoff=60)
        if x is not None:
            return x[0]
        else:
            return None
    
    return  (dbt.ref("test_restaurants").to_pandas()
                .assign( restaurant_user_input=lambda df: df.RESTAURANTS_USER_INPUT.apply(custom_scorer) )
    )


def main():
    print('ici')

if __name__ == "__main__":
    main()