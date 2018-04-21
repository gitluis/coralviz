# Corals :telescope: :bar_chart:
| Course    | Course Name                    | Student        |
| :-------: | :----------------------------- | :------------- |
| CAP 6737  | Interactive Data Visualization | Luis A. Rivera |

## Abstract
The idea is to obtain a coral dataset containing coral information such as location, coral bleaching, or coral diseases with enough different corals and/or metrics to generate multiple visualizations of the data set for further analysis. A dashboard containing different graphs showing the information in different forms which could even lead to detecting any similarities in between the coral samples.

## Datasets
Coral datasets available inside the `data` directory. Coral data sets descriptions can also be found in text format inside the `data` directory.

## Coral Bleaching & Diseases
Coral Bleaching is the process by which coral losses its own major source of food which is algae surrounding it (Figure 1). When algae leave the coral, it becomes vulnerable to diseases. This can be caused by many factors such as changes in ocean temperature, ocean pollution, overexposure to sunlight, extreme low tides, overall climate changes (CO2), ocean acidification (pH level changes), climate precipitation, altered ocean currents, storms, sea level rise, global warming and among many other (Figure 2).
In addition, coral can be affected by diseases caused by infections from bacteria, viruses or stressors as previously mentioned in Figure 2 which slowly kill the coral by consuming the living tissue or leaving large patches of living coral tissue to slough off exposing coral’s skeleton. Some of these diseases are Black-band disease, Dark-spot disease, Patchy necrosis (white pox), White plague, White-band disease, Yellow-band disease, Algae disease, Fungal disease and many others. See Figure 3 to Figure 11 in [Appendix](https://github.com/gitluis/coralviz#appendix) for a visual picture of coral diseases.

## Coral Bleaching Data Preparation Summary
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

## Coral Disease Data Preparation Summary
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

## License
Go to [LICENSE](https://github.com/gitluis/coralviz/blob/master/LICENSE) for more information.

## References
[1] NOAA. Are corals animals or plants? National Ocean Service website, https://oceanservice.noaa.gov/facts/coral_bleach.html, accessed on 04/21/2018.

[2] ReefBase: A Global Information System for Coral Reefs. March, 2018. http://www.reefbase.org.

[3] National Geographic. Coral Reefs 101 | National Geographic. November 7, 2017. https://youtu.be/ZiULxLLP32s.

[4] NOAA. What is coral bleaching? National Ocean Service website, https://oceanservice.noaa.gov/facts/coral_bleach.html, accessed on March 2018.

[5] NOAA. How does climate change affect coral reefs? National Ocean Service website, https://oceanservice.noaa.gov/facts/coralreef-climate.html, accessed on March 2018.

## Appendix
Figure 1. Coral Bleaching
![Reference 4](https://github.com/gitluis/coralviz/blob/master/images/coral-bleaching-explained.jpg)

Figure 2. Coral Threats
![Reference 5](https://github.com/gitluis/coralviz/blob/master/images/coral-threats.png)
