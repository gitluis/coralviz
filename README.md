# Corals :telescope: :bar_chart:
| Course    | Course Name                    | Student        |
| :-------: | :----------------------------- | :------------- |
| CAP 6737  | Interactive Data Visualization | Luis A. Rivera |

## Abstract
The idea is to obtain a coral dataset containing coral information such as location, coral bleaching, or coral diseases with enough different corals and/or metrics to generate multiple visualizations of the data set for further analysis. A dashboard containing different graphs showing the information in different forms which could even lead to detecting any similarities in between the coral samples.

## Datasets
Coral datasets available inside the `data` directory. Coral data sets descriptions can also be found in text format inside the `data` directory.

## Introduction
- [Coral Reefs 101 by National Geographic](https://www.youtube.com/watch?v=ZiULxLLP32s)

Other Videos:
- https://youtu.be/4RUGmBxe65U?t=46
- https://youtu.be/5ET2B-bEduc?t=5

## Coral Bleaching & Diseases
Coral Bleaching is the process by which coral losses its own major source of food which is algae surrounding it (Figure 1). When algae leave the coral, it becomes vulnerable to diseases. This can be caused by many factors such as changes in ocean temperature, ocean pollution, overexposure to sunlight, extreme low tides, overall climate changes (CO2), ocean acidification (pH level changes), climate precipitation, altered ocean currents, storms, sea level rise, global warming and among many other (Figure 2).

In addition, coral can be affected by diseases caused by infections from bacteria, viruses or stressors as previously mentioned in Figure 2 which slowly kill the coral by consuming the living tissue or leaving large patches of living coral tissue to slough off exposing coral’s skeleton. Some of these diseases are Black-band disease, Dark-spot disease, Patchy necrosis (white pox), White plague, White-band disease, Yellow-band disease, Algae disease, Fungal disease and many others. See Figure 3 to Figure 11 in [Appendix](https://github.com/gitluis/coralviz#appendix) for a visual picture of coral diseases.

## Data Preparation Summary
Data: `CoralBleaching.csv`

| Variable Name       | Variable Changes |
| :------------------ | :--------------- |
| id                  |                  |
| region              | Blanks recoded to NAs |
| subregion           | Blanks recoded to NAs |
| country             |                  |
| location            |                  |
| lat                 |                  |
| lon                 |                  |
| month               | Dropped          |
| year                |                  |
| depth               | Dropped          |
| severity_code       |                  |
| bleaching_severity  | Level "Severity Unknown" recoded to "Unknown" |
| coral_family        | Reduced levels from 121 to 23 |
| coral_species       |                  |
| percentage_affected | Conversion to Numeric |
| bleaching_duration  | Dropped          |
| mortality_code      | Conversion to Categorical & Reduced levels from 6 to 4 |
| mortality           | Conversion to Numeric |
| recovery_code       | Dropped          |
| recovery            | Dropped          |
| survey_type         | Dropped          |
| survey_area         | Dropped          |
| water_temperature   | Conversion to Numeric |
| other_factors       | Dropped          |
| remarks             | Dropped          |
| source              |                  |
| reference_code      | Dropped          |
| country_code        |                  |

Data: `CoralDisease.csv`

| Variable Name        | Variable Changes |
| :------------------- | :--------------- |
| id                   |                  |
| disease_type         | Reduced levels from 52 to 11 |
| year                 |                  |
| lat                  |                  |
| lon                  |                  |
| region               | Blanks recoded with NAs |
| subregion            | Blanks recoded with NAs |
| country              |                  |
| location             |                  |
| nearest_town         |                  |
| genus_species        |                  |
| percentage_incidence |                  |
| disease_remarks      | Dropped          |
| mortality_percentage |                  |
| diseased_percentage  |                  |
| reference_id         | Dropped          |
| remarks              | Dropped          |
| country_code         |                  |
| source               |                  |

## Data Visualization
- [Coral Bleaching Data Viz](https://public.tableau.com/profile/luis.rivera4167#!/vizhome/CoralBleachingDataViz/CoralBleachingDataViz)

| Dashboard | Description |
| :-------- | :---------- |
| Bleaching Observations Map | Coral reef observations colored by bleaching severity across the world. |
| Coral Severity Levels | Overall number of coral reefs per bleaching severity (class). |
| Coral Mortality Levels | Overall number of coral reefs per mortality level (class). |
| Water Temperature over Years | Average water temperature over the years captured. Also displays it by bleaching severity. |
| Percentage of Corals Bleached by Water Temperature | Percentage of corals bleached during observation as water temperature increases (hotter). |
| Percentage of Corals Bleached by Mortality Level | Percentage of corals bleached during observation as mortality level increases. |


- [Coral Disease Data Viz](https://public.tableau.com/profile/luis.rivera4167#!/vizhome/CoralDiseaseDataViz/CoralDiseaseDataViz)

| Dashboard | Description |
| :-------- | :---------- |
| Disease Observations Map | Coal reef observations colored by disease type across the world. |
| Coral Diseases | Overall number of coral reefs per disease. |
| Percentage of Coral Disease by Area Affected | Percentage of coral disease incidence (rate) versus diseases area affected in the coral reef. |
| Percentage of Coral Disease by Mortality Level | Percentage of coral disease incidence (rate) as mortality level increases. |

## License
Go to [LICENSE](https://github.com/gitluis/coralviz/blob/master/LICENSE) for more information. Any work from NOAA or ReefBase must follow their respective citation, licensing and terms accordingly. Go to [NOAA.gov](http://www.noaa.gov/) or [ReefBase.org](http://www.reefbase.org/main.aspx) for more information.

## References
[1] NOAA. Are corals animals or plants? National Ocean Service website, https://oceanservice.noaa.gov/facts/coral_bleach.html, accessed on 04/21/2018.

[2] ReefBase: A Global Information System for Coral Reefs. March, 2018. http://www.reefbase.org.

[3] National Geographic. Coral Reefs 101 | National Geographic. November 7, 2017. https://youtu.be/ZiULxLLP32s.

[4] NOAA. What is coral bleaching? National Ocean Service website, https://oceanservice.noaa.gov/facts/coral_bleach.html, accessed on March 2018.

[5] NOAA. How does climate change affect coral reefs? National Ocean Service website, https://oceanservice.noaa.gov/facts/coralreef-climate.html, accessed on March 2018.

## Appendix
##### Figure 1. Coral Bleaching
![](https://github.com/gitluis/coralviz/blob/master/images/coral-bleaching-explained.jpg)

##### Figure 2. Coral Threats
![](https://github.com/gitluis/coralviz/blob/master/images/coral-threats.png)

##### Figure 3. Healthy Coral
![](https://github.com/gitluis/coralviz/blob/master/images/healthy%20coral.jpg)

##### Figure 4. Bleaching Coral
![](https://github.com/gitluis/coralviz/blob/master/images/bleaching%20coral.jpg)

##### Figure 5. Black-band Disease
![](https://github.com/gitluis/coralviz/blob/master/images/black-band%20disease.jpg)

##### Figure 6. White-band Disease
![](https://github.com/gitluis/coralviz/blob/master/images/white-band%20disease.jpg)

##### Figure 7. White plague Disease
![](https://github.com/gitluis/coralviz/blob/master/images/white%20plague%20disease.jpg)

##### Figure 8. Yellow-band, White-band, Black-band Diseases
![](https://github.com/gitluis/coralviz/blob/master/images/black%20white%20and%20yellow%20band%20disease.jpg)

##### Figure 9. Dark-spot Disease
![](https://github.com/gitluis/coralviz/blob/master/images/coral%20dark%20spot%20disease.jpg)

##### Figure 10. White Pox Disease
![](https://github.com/gitluis/coralviz/blob/master/images/white%20pox%20disease.jpg)

##### Figure 11. White Plague Type 2 Disease
![](https://github.com/gitluis/coralviz/blob/master/images/white%20plague%20type%20ii%20disease.jpg)
