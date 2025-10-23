import streamlit as st
import yfinance as yf

st.set_page_config(page_title="محلل الأسهم", layout="wide")
st.title("📈 محلل الأسهم الذكي")

# إدخال رمز السهم
symbol = st.text_input("أدخل رمز السهم (مثال: AAPL, TSLA, MSFT)")

if symbol:
    stock = yf.Ticker(symbol)
    
    # بيانات عامة
    info = stock.info
    st.subheader(f"معلومات عن {info.get('shortName', symbol)} ({symbol})")
    st.write(f"القطاع: {info.get('sector', 'غير متوفر')}")
    st.write(f"السوق: {info.get('exchange', 'غير متوفر')}")
    st.write(f"الموقع: {info.get('website', 'غير متوفر')}")
    
    # أسعار
    st.subheader("الأسعار")
    st.write(f"آخر سعر: ${info.get('regularMarketPrice', 'غير متوفر')}")
    st.write(f"أعلى سعر خلال 52 أسبوع: ${info.get('fiftyTwoWeekHigh', 'غير متوفر')}")
    st.write(f"أدنى سعر خلال 52 أسبوع: ${info.get('fiftyTwoWeekLow', 'غير متوفر')}")
    
    # مؤشرات أساسية
    st.subheader("المؤشرات المالية")
    st.write(f"القيمة السوقية: {info.get('marketCap', 'غير متوفر')}")
    st.write(f"نسبة السعر إلى الربح (PE): {info.get('trailingPE', 'غير متوفر')}")
    st.write(f"العائد على السهم (EPS): {info.get('trailingEps', 'غير متوفر')}")
    
    # مؤشرات فنية بسيطة
    st.subheader("مؤشرات فنية")
    hist = stock.history(period="1y")
    st.line_chart(hist['Close'])
