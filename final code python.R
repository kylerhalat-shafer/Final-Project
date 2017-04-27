# -*- coding: utf-8 -*-
"""
Spyder Editor

This is a temporary script file.
"""
##The following packages I had to install via the command line 
##These packages were updated into my computer and I would have to install
##them on other computers to make this code run efficiently 

## pip install xlwt
## pip install Homebrew 
## pip install googlefinance 
## pip install plotly
## pip install yahoo-finance
## pip install Django==1.11
## Done in Console --> git clone https://github.com/django/django.git
## pip install django-import-export 


##Importing pip -- I needed these so certain commands would work
import pip
from pip.commands.install import InstallCommand
from pip.req import InstallRequirement

implicit_pip = True
implicit_setuptools = True
implicit_wheel = True

##Pip package
##This installation did not work properly --
##I kept it because of the other packages that were installed 
import os.path
import pkgutil
import shutil
import sys
import struct
import tempfile
PY3 = sys.version_info[0] == 3
iterbytes = iter
from base64 import b85decode
_b85alphabet = (b"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"
                b"abcdefghijklmnopqrstuvwxyz!#$%&()*+-;<=>?@^_`{|}~")
def b85decode(b):
  _b85dec = [None] * 256
for i, c in enumerate(iterbytes(_b85alphabet)):
  _b85dec[c] = i

##Monte Carlo Simulation: test for doing a Monte Carlo simulation
##Where the risk analysis may go in the future

import numpy as np
import math
import matplotlib.pyplot as plt
from scipy.stats import norm
import quandl
import pandas as pd
import matplotlib.pyplot as plt
from scipy.stats import norm
import quandl
import pandas as pd

aapl = quandl.get("WIKI/AAPL.4", transformation = "rdiff" , start_date = "2012-04-13",end_date = "2017-04-13")

mu = np.mean(aapl)
sd = np.std(aapl)
T =500

daily_returns = np.random.normal(mu/T,sd/math.sqrt(T),T)+1
for x in daily_returns: 
  price_list.append(price_list[-1]*x)

plt.plot(price_list)
plt.hist(daily_returns-1, 100)
plt.show()

##Importing data from quandl: This will be used for certain shares that were
## unable to import from either Yahoo!Finance or Google
mydata = quandl.get("FRED/GDP")
mydata = quandl.get("EIA/PET_RWTC_D")
mydata = quandl.get("EIA/PET_RWTC_D", returns="numpy")
mydata = quandl.get("FRED/GDP", start_date="2001-12-31", end_date="2005-12-31")
mydata = quandl.get(["NSE/OIL.1", "WIKI/AAPL.4"])
mydata = quandl.get("WIKI/AAPL", rows=5)
mydata = quandl.get("EIA/PET_RWTC_D", collapse="monthly")
mydata = quandl.get("FRED/GDP", transformation="rdiff")

##API to Google Finance
##I downloaded this API as well becasue in the future I can create a portfolio
##Then import the data from the portfolio, now that the datareader is installed
import pandas_datareader.data as web
import datetime
start = datetime.datetime(2010,1,1)
end = datetime.datetime(2013, 1,27)
f = web.DataReader("F", 'google', start,end)
f.ix['2010-01-04']

##Amended version -- This is a beta version that could possibly have more 
##features in the future 
q = web.get_data_google(['AMZN','GOOG'])

##API -- Yahoo Finance: Single Share that is within the Index
##For now this is what I am using to import shares individually 
##I am able to set the "date" to present, so that updating will be easy in the
##future 
from yahoo_finance import Share
yahoo = Share('BXP')
print (yahoo.get_open())
print(yahoo.get_price())

##Making Indexes: I will be able to run this code with different shares multiple
##times 
import pandas as pd
from yahoo_finance import Share
yahoo = Share('BXP')
bxp = yahoo.get_historical('2013-01-01','2017-04-24')
data = pd.DataFrame(bxp)
data.head()

##Transferring data to an excel or csv file, so I am able to run my risk model
##On the data gathered 

##On a Mac ** it is easy to change formatting 
data.to_csv("/Users/Kyler.HalatShafer/Desktop/test.csv")
##On a PC
data.to_csv("C:\\Users\\kh5967a\\Desktop\\test.csv)
            
            
            ##Setting up Quandl API with api key, rather than just downloading access to
            ##the database 
            import quandl
            quandl.ApiConfig.api_key = '56xSrqqxNsnmjdvH7wa_'
            
            ##Displaying data within Python
            import quandl
            data = quandl.get('NSE/OIL')
            data.head()
            
            import quandl
            data = quandl.get('NSE/OIL', start_date='2010-01-01', end_date='2014-01-01',collapse='annual', transformation='rdiff',rows=4)
            
            data = quandl.get(['WIKI/AAPL.11','WIKI/MSFT.11'])
            
            import quandl 
            data = quandl.get_table('ZACKS/FC')
            
            import quandl
            data = quandl.get_table('ZACKS/FC', paginate=True)
            
            ##Shows data that is retrieved from quandl
            mydata = quandl.get("WIKI/AVB)
print(mydata)

##Lines 129-152 about Quandl, can also have this information exported to 
##Excel or csv 
##Once the information is exported to either of these formats, compiling the
##data sets can be done without much difficulty 

##Pandas is important to have for numeruous reasons 
import pandas as pd

# Create a Pandas dataframe from the data.
df = pd.DataFrame({'Data': [10, 20, 30, 20, 15, 30, 45]})

# Create a Pandas Excel writer using XlsxWriter as the engine.
writer = pd.ExcelWriter('pandas_simple.xlsx', engine='xlsxwriter')

# Convert the dataframe to an XlsxWriter Excel object.
df.to_excel(writer, sheet_name='Sheet1')

# Close the Pandas Excel writer and output the Excel file.
writer.save()

# Get the xlsxwriter objects from the dataframe writer object.
workbook  = writer.book
worksheet = writer.sheets['Sheet1']

# Create a chart object.
chart = workbook.add_chart({'type': 'column'})

# Configure the series of the chart from the dataframe data.
chart.add_series({'values': '=Sheet1!$B$2:$B$8'})

# Insert the chart into the worksheet.
worksheet.insert_chart('D2', chart)

# Apply a conditional format to the cell range.
worksheet.conditional_format('B2:B8', {'type': '3_color_scale'})

# Add some cell formats.
format1 = workbook.add_format({'num_format': '#,##0.00'})
format2 = workbook.add_format({'num_format': '0%'})

# Set the column width and format.
worksheet.set_column('B:B', 18, format1)

# Set the format but not the column width.
worksheet.set_column('C:C', None, format2)

# Write each dataframe to a different worksheet.
df1.to_excel(writer, sheet_name='Sheet1')
df2.to_excel(writer, sheet_name='Sheet2')
df3.to_excel(writer, sheet_name='Sheet3')

# Position the dataframes in the worksheet.
df1.to_excel(writer, sheet_name='Sheet1')  # Default position, cell A1.
df2.to_excel(writer, sheet_name='Sheet1', startcol=3)
df3.to_excel(writer, sheet_name='Sheet1', startrow=6)

# Write the dataframe without the header and index.
df4.to_excel(writer, sheet_name='Sheet1',
             startrow=7, startcol=4, header=False, index=False)

import pandas as pd
import StringIO

# Create a Pandas dataframe from the data.
df = pd.DataFrame({'Data': [10, 20, 30, 20, 15, 30, 45]})

# Note, Python 2 example. For Python 3 use: output = io.BytesIO().
output = StringIO.StringIO()

# Use the StringIO object as the filehandle.
writer = pd.ExcelWriter(output, engine='xlsxwriter')

# Write the data frame to the StringIO object.
pd.DataFrame().to_excel(writer, sheet_name='Sheet1')

writer.save()
xlsx_data = output.getvalue()

##Code to import financial data and export to excel: This is another way to do 
##What I did earlier, I like the first method a bit better and it is cleaner in
##application 
import pandas as pd
from pandas_datareader.data as web
from datetime import datetime

symbols = ['GOOG','AAPL']

try:
  df = pd.read_excel('NewFile.xlsx')
except:
  df = pd.DataFrame()

for symbol in symbols:
  ClosingPrice = DataReader(symbol, 'yahoo', datetime(2015,1,1), datetime(2015,9,1))
ClosingPrice = ClosingPrice.reset_index()
ClosingPrice['Symbol'] = symbol
df = df.append(ClosingPrice)

writer = pd.ExcelWriter('NewFile.xlsx', engine='xlsxwriter')
df.to_excel(writer,sheet_name='Sheet1',index=False)
writer.save()

##Amending that file
df = pd.read_excel('NewFile.xlsx')
symbols = ['G']

for symbol in symbols:
  ClosingPrice = DataReader(symbol, 'yahoo', datetime(2015,1,1), datetime(2015,9,1))
ClosingPrice = ClosingPrice.reset_index()
ClosingPrice['Symbol'] = symbol
df = df.append(ClosingPrice)

writer = pd.ExcelWriter('NewFile.xlsx', engine='xlsxwriter')
df.to_excel(writer,sheet_name='Sheet1',index=False)
writer.save()

##Plotly 
##Working with Plotly helped me display my data in numerous ways 
##For financial data time series is the most common, but looking at a density 
##spiral is an interesting way to display this information 

import pandas as pd
import numpy as np
import plotly.plotly as py
import plotly.graph_objs as go

N = 100.0
r = dict( r = [ np.random.poisson(N)*(np.cos((i/4)*np.pi/180)) for i in range(360) ] )
df = pd.DataFrame(r)
df_ma = pd.ewma(df,4.0)
df_ma.head()

data = []
data.append(
  go.Scatter(
    t=df.index,
    r=df['r'],
    name = 'Scatter',
    mode='markers',
    marker=dict(
      color='rgb(255,78,252)',
      size=8 )
  ) )
data.append(
  go.Scatter(
    t=df_ma.index,
    r=df_ma['r'],
    name = 'Moving average',
    mode='lines',
    line=dict(color='rgb(69,124,235)'),
    marker=dict(
      color='rgb(69,124,235)',
      line=Line(width=2,
                color='rgb(69,124,235)') ),
  ) )
layout = go.Layout(
  angularaxis=dict(
    tickcolor='#CCC',
    showline=False,
  ),
  orientation=270
)

fig = go.Figure(data=data, layout=layout)

# IPython notebook
# py.iplot(fig, filename='pandas-polar-chart')

url = py.plot(fig, filename='pandas-polar-chart')

##I did these as practice to understand how to use Plotly a bit further 
##Plotly--Famous Equations

import plotly.plotly as py
import plotly.figure_factory as ff

data_matrix = [['Name', 'Equation'],
               ['Pythagorean Theorem', '$a^{2}+b^{2}=c^{2}$'],
               ['Euler\'s Formula', '$F-E+V=2$'],
               ['The Origin of Complex Numbers', '$i^{2}=-1$'],
               ['Einstein\'s Theory of Relativity', '$E=m c^{2}$']]

table = ff.create_table(data_matrix)
py.iplot(table, filename='latex_table')

##Plotly displaying stock information 
##This displays a stock with open/close prices in a grid format, but is 
##exported to plotly 

import plotly.plotly as py
import plotly.figure_factory as ff

from datetime import date
import pandas_datareader.data as web

di = web.DataReader("aapl", 'yahoo', date(2009, 1, 1), date(2009, 3, 1))

# Converting timestamp to date 
di["Date1"] = di.index.date
di.set_index("Date1", drop=True, inplace=True)

table = ff.create_table(di, index=True, index_title='Date')
py.iplot(table, filename='index_table_pd')

##Timeseries Financial Charting -- This is exported to my Plotly page
##Change the pd.read_csv() <-- would be an excel file and then the information 
##is imported with column headers 

import plotly.plotly as py
import plotly.graph_objs as go

import pandas as pd

df = pd.read_csv("https://raw.githubusercontent.com/plotly/datasets/master/finance-charts-apple.csv")

trace_high = go.Scatter(
  x=df.Date,
  y=df['AAPL.High'],
  name = "AAPL High",
  line = dict(color = '#17BECF'),
  opacity = 0.8)

trace_low = go.Scatter(
  x=df.Date,
  y=df['AAPL.Low'],
  name = "AAPL Low",
  line = dict(color = '#7F7F7F'),
  opacity = 0.8)

data = [trace_high,trace_low]

layout = dict(
  title='Time Series with Rangeslider',
  xaxis=dict(
    rangeselector=dict(
      buttons=list([
        dict(count=1,
             label='1m',
             step='month',
             stepmode='backward'),
        dict(count=6,
             label='6m',
             step='month',
             stepmode='backward'),
        dict(step='all')
        ])
    ),
    rangeslider=dict(),
    type='date'
  )
)

fig = dict(data=data, layout=layout)
py.iplot(fig, filename = "Time Series with Rangeslider")

## Test Yahoo Finance API: trying to use this format to pull multiple stocks 
## at once 

import urllib.request
import time

stockstoPull = 'AMD', 'BAC', 'MSFT', 'TXN', 'GOOG'

def pullData(stock):
  fileLine = stock + '.csv'
urltovisit = 'http://chartapi.finance.yahoo.com/instrument/1.0/'+stock+'/chartdata;type=quote;range=1y/csv'
with urllib.request.urlopen(urltovisit) as f:
  sourceCode = f.read().decode('utf-8')
splitSource = sourceCode.split('\n')

for eachLine in splitSource:
  splitLine = eachLine.split(',')
if len(splitLine) == 6:
  if 'values' not in eachLine:
  saveFile = open(fileLine,'a')
linetoWrite = eachLine+'\n'
saveFile.write(linetoWrite)

print('Pulled', stock)
print('...')
time.sleep(.5)

if __name__=="__main__":
  for eachStock in stockstoPull:     
  pullData(eachStock)