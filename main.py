import pandas as pd
import numpy as np
import warnings
warnings.filterwarnings('ignore')
import joblib

# get input from shell
import sys
def main():
    model = joblib.load(open('model.pkl', 'rb'))

    # Load column names
    column_names = joblib.load(open('model_columns.pkl', 'rb'))

    # Read the test data
    df = pd.read_csv('df_test.csv')

    # Select a single row from the dataframe (assuming it's a DataFrame)
    df_row = df.head(1)

    # Use the same columns used during training
    df_row = df_row[column_names]

    # Predict using the loaded model
    prediction = model.predict(df_row)
    prediction_proba = model.predict_proba(df_row)

    # return result
    return {"prediciton": int(prediction[0]), "probability": float(f"{np.max(prediction_proba)*100:.2f}")}

if __name__ == '__main__':
    result = main()

    print(result)