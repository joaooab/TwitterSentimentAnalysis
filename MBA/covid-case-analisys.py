import numpy as np
from wordcloud import WordCloud,STOPWORDS
import matplotlib.pyplot as plt
import pandas as pd
import plotly.express as px

def showFrequencySource():
    sources = set(df["source"])
    length = []
    for source in sources:
        df_source = df[df["source"] == source]
        len_source = len(df_source)
        length.append(len_source)
    sources2 = list(sources)
    data = {"source": sources2, "frequency": length}
    data2 = pd.DataFrame(data=data).sort_values(by="frequency").reset_index(drop=True)
    data3 = data2[data2["frequency"] >= 100]
    fig = px.bar(data3, x="frequency", y="source", orientation='h', width=900, height=700,
                 title="Most frequent ways Twitter users accessed their accounts")
    fig.show()

def printShowNumbersAndColumns():
    nRow, nCol = df.shape
    print(f"There are {nRow} rows and {nCol} columns.")
    df["year"] = pd.DatetimeIndex(df["date"]).year
    df2 = df[df["year"] == 2021]
    nRow, nCol = df2.shape
    print(f"In 2021. There are {nRow} rows and {nCol} columns.")

def printMissingValues():
    print(df.dtypes)
    print(df.isna().sum() / len(df))
    print(df.fillna("unknown"))


def printLocations():
    print(len(set(df["user_location"])))
    print(set(df["user_location"]))


def showPieSource():
    data = {"Web": [32.751364], "iPhone": [31.928076], "Android": [23.457809],
            "Outros": [11.862751]}
    data5 = pd.DataFrame(data=data).T.reset_index().rename(columns={"index": "source type", 0: "percentage%"})
    fig = px.pie(data5, values='percentage%', names='source type', title='How Twitter users access their accounts')
    fig.show()


if __name__ == '__main__':
    df = pd.read_csv("covidvaccine.csv")
    print("-------Number and columns-------")
    printShowNumbersAndColumns()
    print("-------Missing Values-------")
    printMissingValues()
    print("-------Locations-------")
    printLocations()
    print("-------Frequency Source-------")
    showFrequencySource()
    print("-------Frequency Source-------")
    showPieSource()
