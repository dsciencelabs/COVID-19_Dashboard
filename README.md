---
title: "Shiny Dashbord for Tracking and modeling COVID-19 datasets"
date: "2020-04-22"
output:
  html_document:
    number_sections: true
    fig_caption: true
    toc: true
    fig_width: 7
    fig_height: 4.5
    theme: cosmo
    highlight: tango
    code_folding: show #hide
    self_contained: no
---



# Shiny Dashbord for Tracking and modeling COVID-19 datasets

* COVOD19 is a Shiny app developed by Karim Mezhoud, Data Scientist at National Center for Nuclear Sciences and Technolgies of Tunisia.

* The goal is to follow the trend of the evolution of this pandemy and estimate when it will be safe to get back to normal life.

* The map overview shows daily confirmed (or positive for US data), recovered , and deaths cases. The two tables quickly show us the classification of dead and confirmed cases in the countries of the world.

* The Spread tab show which Country has the highest Pread rate. Please see below how the Spread is Computed.

* The Prediction Tab implements SIR and SEIRD models mainly used in epidemiology. These two model predict the numbers of  Suceptible, Exposed, Infected, Recovered and Deaths people during the selected range of period. The models are not yet optimized for COVID-19 and the prediction are not True.

<iframe width="560" height="315" src="https://www.youtube.com/embed/3s4FfjMkLWQ" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


# Data Source

- [COVID19 Countries Times Series](https://github.com/ulklc/covid19-timeseries) 

- [COVID19 USA States data Source](https://covidtracking.com/api/)

- [COVID19 data of  China, Canada, Autralia  Provinces](https://github.com/CSSEGISandData/COVID-19)

- [USA States names, density (p/mi2), population, Area (mi2)](https://worldpopulationreview.com/states/state-densities/)

- [USA States names,  Longitudes, Latitudes, apla2 code ](https://github.com/COVID19Tracking/covid-tracking-dash/blob/master/data/states.csv)

- [US States alpha2 code,  Covid times Series data (starts 2020/03/04 states-daily.csv) ](https://covidtracking.com/api/)

- [Chinese Province Area & Population 2018](http://www.citypopulation.de/en/china/cities/)

- [Macau demography (2020)](https://worldpopulationreview.com/countries/macau-population/)

- [Hong Kong demography (2018)](https://en.wikipedia.org/wiki/Hong_Kong)

- [Inner Mongolia  demography (2020)](https://www.worldometers.info/world-population/mongolia-population/)

- [Australia Province Areas & Population](https://en.wikipedia.org/wiki/States_and_territories_of_Australia)

- [Canada Province Area & Population](https://en.wikipedia.org/wiki/Provinces_and_territories_of_Canada)


# Normalization and scaling

- $Case\;(km{^2}) = \frac{Confirmed}{Area}$

- $Density = \frac{Population}{area}= \frac{Persons}{km^{2}}$

- $Spread = \frac{Case\;(km^{2}) \;* \;100}{Density} = \frac{ \frac{Confirmed}{Area}\; *\; 100}{\frac{Persons}{km^{2}}}= \frac{Confirmed \;* \;100 \; *\; km^{2}}{Area \; * \;Persons}$ (rate without unit, 100 is just to make Map lisible)

- $Active = Confirmed \;- \;Recovered\; -\; Death$

- $Mortality = \frac{Death \; * \;100}{Confirmed}$

- $new1Confirmed \;=  last \;Confirmed \;Cases \;(24h)$

- $new3Confirmed \;= \;last \;Confirmed \;Cases \;3 \;days \;ago$

- $g1 = 0.5 * (new1Confirmed+1)/(Confirmed{_}per100k+1)$ 

- $g3 = 0.3 * (new3Confirmed+1)/(Confirmed{_}per100k+1)$

- $g7 = 0.2 * (new7Confirmed+1)/(Confirmed{_}per100k+1)$

- $g = g1 + g3 + g7$

- if $$[g>1 \;or\; g>0.5 \;or\; g>0.2 \;or\; g>0.1 \;or\; g>0.05 \;or\; g>0.02 \;or\; g>0.01 \;or\; g>0.005 \;or\; g>0.002 \;or\; g>0.001 \;or\; g]$$ Then 

$$Containment\; Score\; = \;[0\;or\;1\;or\;2\;or\;3\;or\;4\;or\;5\;or\;6\;or\;7\;or\;8\;or\;9\;or\;10]$$ 

- $CircleMarkers \;radius\; of\; Confirmed\; = \;(Cumulative \;Confirmed)^{1/4}$ 

- $CircleMarkers \;radius \;of \;Deaths \;= \;(Cumulative Death)^{1/4}$ 

- $CircleMarkers \;radius \;of \;Confirmed \;(24h) \;= \;(Confirmed (24h))^{1/4}$ 

- $CircleMarkers \;radius \;of \;Deaths \;(24h) \;= \;(Death (24h))^{1/4}$ 

# Acknowledgment

* A special Thansk to all developper that are working hard to collect and curate the datasets available in different site.

* A great Thanks for Epidemiologist, Data Scientist who share their works and help developer.
