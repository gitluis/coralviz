# Data

These files are a snapshot of four ReefBase datasets, downloaded in March 2018. ReefBase ([reefbase.org](http://www.reefbase.org)) is now offline, and UNEP-WCMC lists the Global Coral Disease Database as a legacy database with no downloadable data. This folder is therefore the copy this project depends on, so keep it as is.

## Files

| File | Rows | Columns | Encoding | Made by | Used by |
| :--- | ---: | ---: | :--- | :--- | :--- |
| `CoralBleachingRaw.csv` | 6,190 | 28 | UTF-8 | ReefBase download | `bleaching_analysis.R` |
| `CoralBleaching.csv` | 6,190 | 19 | UTF-8 | `bleaching_analysis.R` | Coral Bleaching Data Viz |
| `CoralDiseasesRaw.csv` | 7,354 | 19 | Latin-1 | ReefBase download | `diseases_analysis.R` |
| `CoralDiseases.csv` | 7,354 | 16 | Latin-1 | `diseases_analysis.R` | Coral Disease Data Viz |
| `MonitoringSitesRaw.csv` | 4,968 | 14 | Latin-1 | ReefBase download | Not used |
| `ReefLocationsRaw.csv` | 10,048 | 15 | Latin-1 | ReefBase download | Not used |

Column headers were lowercased after download; otherwise the `*Raw.csv` files are as ReefBase delivered them. The main README's Data Preparation Summary lists every change made to the cleaned files.

## Field definitions

Each dataset has a ReefBase notes file describing its columns: `CoralBleaching.txt`, `CoralDiseases.txt`, `MonitoringSites.txt`, and `ReefLocations.txt`. In `CoralBleaching.txt`, the first `Severity_Code` value shows as a garbled character; it is `-1: Unknown`.

## Links inside the data

- **`source` column.** About 120 bleaching records cite a web page, mostly from 1998–2006. Many of those pages no longer exist; the [Wayback Machine](https://web.archive.org) is the best way to follow one. Two URLs were already malformed in ReefBase's export.
- **Links in the notes files.** These are ReefBase's own text and are left unchanged. The ReefBase pages and the `reefbase@cgiar.org` contact belong to the discontinued project. Coral-List now lives at [lists.coralreefs.org](https://lists.coralreefs.org/mailman/listinfo/coral-list), and the UNEP-WCMC coral disease page is replaced by a [legacy catalog entry](https://wesr-search.unep.org/ckan/dataset/unep-wcmc-rsrc-non-spatial-dataset-global-coral-disease-database).

## How to cite

- ReefBase: A Global Information System for Coral Reefs. March 2018. http://www.reefbase.org (site now offline). This is ReefBase's requested citation, also in `citation.txt`.
- The bleaching dataset is also published by WorldFish as [Coral Bleaching Data](https://worldfishcenter.org/data/coral-bleaching-data), https://doi.org/10.7910/DVN/KUVQKY. The files here have not been compared against that release.
- The disease data originates from UNEP-WCMC and NOAA (2010), Global Coral Disease Database, https://resources.unep-wcmc.org/products/WCMC_PT045 (legacy).

## Terms of use

The data remain under the ReefBase Data License referenced in each notes file. The repository's MIT license covers the code and documentation, not these datasets.
