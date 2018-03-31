
# Open file and read header
with open("data/ReefLocations.csv", "r") as f:
    header = f.read().splitlines()[0]

    s = ""

    # change all column strings to lower case
    for column in header.split(","):
        s += column.lower() + ","

    # remove last comma
    s = s[:len(s)-1]

    # display
    print
    print s
