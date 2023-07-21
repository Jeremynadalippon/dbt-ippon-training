from fuzzywuzzy import process
import pandas as pd





def main():
    df_restaurants = pd.read_csv("seeds/restaurants.csv")
    df_test = pd.read_csv("seeds/test_restaurants.csv")

    def custom_scorer(string):
        x = process.extractOne(string, df_restaurants["name"], score_cutoff=60)
        if x is not None:
            return x[0]
        else:
            return None
    print('coucou')
    
    return df_test.assign(restaurant_user_input=lambda df: df["restaurants_user_input"].apply(custom_scorer))

    

if __name__ == "__main__":
    print(main())
