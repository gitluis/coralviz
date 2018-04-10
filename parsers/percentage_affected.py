
"""
Parser for column 'percentage_affected'
"""

import csv
import pandas as pd

# read data
with open("../data/CoralBleaching.csv", "rt") as f:
    data = csv.reader(f)

    print data
