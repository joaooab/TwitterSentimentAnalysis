import inline as inline
import matplotlib
from wordcloud import WordCloud,STOPWORDS
import pandas as pd
import plotly.express as px
%matplotlib inline

if __name__ == '__main__':
    df = pd.read_csv("covidvaccine.csv")
    stopwords = set(STOPWORDS)
    stopwords.add("t")
    stopwords.add("co")
    stopwords.add("https")
    stopwords.add("will")
    stopwords.add("people")
    stopwords.add("amp")
    stopwords.add("time")
    stopwords.add("got")
    stopwords.add("now")
    stopwords.add("got")
    stopwords.add("say")
    stopwords.add("getting")
    stopwords.add("day")
    stopwords.add("today")
    stopwords.add("COVID")
    stopwords.add("vaccine")
    stopwords.add("COVID19")
    stopwords.add("CovidVaccine")
    wordCloud = WordCloud(
        background_color='white',
        max_words=500,
        stopwords=stopwords
    )
    text = df["text"].to_csv()
    wordCloud.generate(text)
    print("First batch:")
    plt.figure(figsize=(18, 18))
    plt.imshow(text, interpolation='bilinear')
    plt.axis('off')
    plt.show()
