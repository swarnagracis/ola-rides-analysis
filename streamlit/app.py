import streamlit as st
import streamlit.components.v1 as components

st.set_page_config(layout="wide")

st.markdown("""
<style>

/* Sidebar navigation buttons */
.nav-button {
    display:block;
    padding:12px 18px;
    margin-bottom:10px;
    background-color:#1f2937;
    border-radius:8px;
    color:white;
    text-decoration:none;
    font-size:22px;
    font-weight:500;
    border:1px solid #2d3748;
    transition: all 0.25s ease;
}

/* Hover effect */
.nav-button:hover {
    background-color:#d6df22;
    color:black;
    border:1px solid #d6df22;
    transform: translateX(4px);
}

</style>
""", unsafe_allow_html=True)

st.sidebar.markdown("## Go to")

dashboard_btn = st.sidebar.button("🖥️ Power BI Dashboard")
sql_btn = st.sidebar.button("🗄 SQL Queries")
info_btn = st.sidebar.button("ℹ Project Info")

st.title("Ola Ride Analysis Dashboard")
if "page" not in st.session_state:
    st.session_state.page = "dashboard"

if dashboard_btn:
    st.session_state.page = "dashboard"

if sql_btn:
    st.session_state.page = "sql"

if info_btn:
    st.session_state.page = "info"

powerbi_url = "https://app.powerbi.com/reportEmbed?reportId=cb51555c-eb3b-4099-88c9-adf2d602fcce&autoAuth=true&ctid=29bebd42-f1ff-4c3d-9688-067e3460dc1f"

if st.session_state.page == "dashboard":
    components.iframe("https://app.powerbi.com/reportEmbed?reportId=cb51555c-eb3b-4099-88c9-adf2d602fcce&autoAuth=true&ctid=29bebd42-f1ff-4c3d-9688-067e3460dc1f", height=900)

elif st.session_state.page == "sql":
    st.header("SQL Queries Used for Business Insights")

    with open("sql/ola_sql.sql") as f:
        st.code(f.read(), language="sql")

elif st.session_state.page == "info":
    st.markdown("""
## About This Project

This project analyzes ride data from **Ola** to uncover operational and customer insights.

### Tools Used
- SQL for data querying
- Power BI for dashboard analytics
- Streamlit for interactive application

### Key Insights
- Ride demand trends
- Revenue distribution
- Cancellation behavior
- Driver & customer rating patterns
""")

