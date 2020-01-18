import csv
import time
import pandas as pd
import numpy as np
from tensorflow.keras.models import load_model

model = load_model('/Users/jay/Documents/Projects/IMU-train/model.h5')


def predict(i):
    df = pd.read_csv("/Users/jay/Documents/Projects/IMU-train/test.csv")
    flatten_data = np.array(df.values.flatten())
    flatten_data = np.array(flatten_data[i:i+480])
    return flatten_data


def panda():
    i = 0
    count = 1
    while(1):
        try:
            input_data = []
            input_data.append(predict(i))
            input_data = np.array(input_data)
            result = model.predict(input_data)
            ans = result[0]
            ans_f = ans[0]
            if(ans_f > 0.5):
                print("Snap!")
            i = i + 60
            count = count + 1
            # print(count)
            time.sleep(1)
        except Exception as e:
            time.sleep(2)
            continue


panda()
