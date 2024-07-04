# TCMALakesWQTimeSeries
Code used to create long-term summer, surface water quality time series for lakes in the Twin Cities seven county metro area.

Timeseries_v6 is surface water data for lakes in the Twin Cities Metro area with long term monitoring data (5 years or more). Data was primarily sourced from the MPCA Water Quality Dashboard and was supplemented by data supplied by WMOs directly.

There is one reported value per lake x date x parameter which means that spatial surveys and duplicate sampling efforts have been collapsed. Details of how this was done can be found in the R script Timeseries_v6.Rmd. A few important points:
(1) The deepest secchi measurement on each date was chosen to avoid averaging locations across the same lake of different maximum depths
(2) Duplicate sampling efforts were averaged by sampling site first, then by lake.
(3) Some lakes with multiple basins were treated as a single lake and others were treated as separate lakes. See details in the R script.

Metadata:
DOW*			    Lake ID number used by MPCA
sampleDate		Date of sampling, YYYY-MM-DD
sampleYear		Year of sampling
parameter**		Chemical parameter measured and units of measure
result			  result value, units are contained in the parameter name
gtlt***			  flag if result is below detection (1) or above max measurement (100) or no flag (0) 
			            Detection limit or max measurement is reported as result
dataSource		where the measurement was sourced from (MPCA WQ Dashboard or individual WMO)
county			  county where the lake is located
Julian			  Julian day calculated using yday from the lubridate r package
Month			    numerical month of the sampling date

*DOWs are generally the ID numbers used by the DNR and MPCA except in the case of a few lakes in which DOWs were altered to deal with multi-basin lakes. See R script for details

**Parameter list is:
secchi.m		        secchi depth in meters
TP.mg_L		          Total phosphorus in miligrams P per liter
TN.mg_L		          Total nitrogen in miligrams N per liter
TKN.mg_L		        Total Kjeldahl nitrogen in miligrams N per liter
NH4.mg_L		        Ammonium in miligrams N per liter
NOX.mg_L		        Nitrate + nitrite in miligrams N per liter
nitrate.mg_L		    Nitrate in miligrams N per liter
nitrite.mg_L		    Nitrite in miligrams N per liter
chla.Pcorr.ug_L	    Chlorophyll a corrected for pheophytin in micrograms per liter
chla.nonPcorr.ug_L	Chlorophyll a not corrected for pheophytin in micrograms per liter
spCond.uS_cm     	  Specific conductivity at 25 degrees C in microsiemens per centimeter
Cl.mg_L		          Chloride in miligrams per liter

***Some gtlt are not exactly 0, 1, or 100. These numbers indicate values below and above detection were averaged to generate the result. These data should be used with care when making statistical inference.
