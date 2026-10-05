import pandas as pd
from sqlalchemy import create_engine

def run_mrp(engine):
    demand = pd.read_sql("SELECT product_id, SUM(qty) AS q FROM sales_orders GROUP BY product_id", engine)
    bom = pd.read_sql("SELECT * FROM bom", engine)
    merged = demand.merge(bom, left_on='product_id', right_on='parent_id')
    merged['required'] = merged['q'] * merged['qty']
    merged.groupby('component_id')['required'].sum().to_sql('mrp_plan', engine, if_exists='replace')
