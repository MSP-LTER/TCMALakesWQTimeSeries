# TCMALakesWQTimeSeries
<pre>
Code used to create long-term surface water quality time series for lakes in the Twin Cities seven county metro area.
Lakes with > 5 years of data were included, which in 2023 consisted of 294 lakes.

Timeseries_v6 is surface water data for lakes in the Twin Cities Metro area with long term monitoring data (5 years or more). Data was primarily sourced from the MPCA Water Quality Dashboard and was supplemented by data supplied by WMOs directly.

There is one reported value per lake x date x parameter which means that spatial surveys and duplicate sampling efforts have been collapsed. Details of how this was done can be found in the R script Timeseries_v6.Rmd. A few important points:
(1) The deepest secchi measurement on each date was chosen to avoid averaging locations across the same lake of different maximum depths
(2) Duplicate sampling efforts were averaged by sampling site first, then by lake.
(3) Some lakes with multiple basins were treated as a single lake and others were treated as separate lakes. See details below.

Metadata:
DOW*			Lake ID number used by MPCA
sampleDate		Date of sampling, YYYY-MM-DD
parameter**		Chemical parameter measured and units of measure
result			result value, units are contained in the parameter name
gtlt***			flag if result is below detection (1) or above max measurement (100) or no flag (0) 
			         Detection limit or max measurement is reported as result
dataSource		where the measurement was sourced from (MPCA WQ Dashboard or individual WMO)
county			county where the lake is located

*DOWs are generally the ID numbers used by the DNR and MPCA except in the case of a few lakes in which DOWs were altered to deal with multi-basin lakes. See R script for details

**Parameter list is:
secchi.m		secchi depth in meters
TP.mg_L		        Total phosphorus in miligrams P per liter
TN.mg_L		        Total nitrogen in miligrams N per liter
TKN.mg_L		Total Kjeldahl nitrogen in miligrams N per liter
NH4.mg_L		Ammonium in miligrams N per liter
NOX.mg_L		Nitrate + nitrite in miligrams N per liter
nitrate.mg_L		Nitrate in miligrams N per liter
nitrite.mg_L		Nitrite in miligrams N per liter
chla.Pcorr.ug_L	    	Chlorophyll a corrected for pheophytin in micrograms per liter
chla.nonPcorr.ug_L	Chlorophyll a not corrected for pheophytin in micrograms per liter
spCond.uS_cm     	Specific conductivity at 25 degrees C in microsiemens per centimeter
Cl.mg_L		        Chloride in miligrams per liter

***Some gtlt are not exactly 0, 1, or 100. These numbers indicate values below and above detection were averaged to generate the result. These data should be used with care when making statistical inference.

MULTI-BASIN ADJUSTMENTS
Many metro lakes have multiple basins or are divided by roads/culverts. In some lakes these are treated as multiple monitoring locations on a single lake and other times they are treated as distinct lakes. The following decisions were made:

Cornelia (27002800)
  N (27002801) and S (27002802) basins will be combined under main lake DOW
Sarah (27019100)
  W (27019101) and E (27019102) basins will be combined under main lake DOW
Shady Oak (27008900)
  N (27008901) and Middle (27008902) bays will be combined under main lake DOW

Marion (19002600)
  Only use data from Marion East (19002601). Marion Middle (19002602) only has 3 data points from one year so it seems unnecessary to average those into the more consistent East monitoring even though E and Middle are considered one lake.

Whaletail
  Separate N (27018401) and S (27018402) basins  
Twin
  Separate Upper (27004201), Middle (27004202), and Lower (27004203) basins
Moore
  Separate E (02007501) and W (02007502) basins
Anderson
  Separate NW (27006201), SE (27006202), and SW (27006203) basins
Island
  Separate N (62007502) and S (62007501) basins.
Long
  Separate N(62006701) and S (62006702) basins.
Wilmes N (82009001) and S (82009002) 
  Only one DOW but should be treated as separate lakes. Will be separated between site 201 and 202
Forest W (82015901), Central (82015902), and E (82015903)
  Only one DOW and these basins are fairly connected, but only the middle basin was treated with alum in 2023 and 2025. For this reason the basins are separated based on their sampling site locations.
  
DATA SOURCES
Data was primarily gathered from the MPCA and MCES public databases, but some data was shared directly with us. dataSource indicates from where the LTER received that data. The organizations listed below also contribute data to the MPCA and MCES, but in those cases that data is just generally attributed to the MPCA or MCES.

MPCA - Minnesota Pollution Control Agency
MCES - Metropolitan Council Environmental Services
RamseyCo - Ramsey County
SWWD - South Washington Watershed District
CCWMO - Carver County Water Management Organization
RPBCWD - Riley Purgatory Bluff Creek Watershed District
ACD - Anoka Conservation District
DNR - Minnesota Department of Natural Resources
NMCWD - Nine Mile Creek Watershed District
CityEagan - City of Eagan
  For questions about City of Eagan data, please contact Water Resources Division of Public Works, 651-675-5300 or WaterRes@EaganMN.gov


</pre>
