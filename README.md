# micro_smart_grids

Repository with Smart Grid simulation code from MATLAB and Simulink along with a report on the Simulation of a Smart Grid at a microgrid level.


## Getting Started

Before running the validation case or the experimental simulation, it is necessary to load the [default MATLAB solar panel data](Simulation/default_PV_data.mat) in the MATLAB workspace. The simulations also require the download of the [Simscape package](https://www.mathworks.com/products/simscape.html).


## Validation Case

To run the theoretical validation case, the [validation grid](power_microgrid_v3_analytic.slxc) should then be opened in MATLAB Simulink and run over a 24h period. The output results from the scopes should then be compared to the output of the [validation script](FYP_analytical_test.m).

## Simulation

The smart micro-grid (settings to match UK electricity grid) can be found [here](Simulation/power_microgrid_v5_battery.slxc). The PV generation profiles come from the [default MATLAB solar panel data](Simulation/default_PV_data.mat), while the domestic load profiles were generated using the. Each load corresponds to a particular profile from this study, and a detail of the loads used can be found in this [spread sheet](Simulation/power_microgrid_v5_battery_load_type.xlsx).


## Built With

* [MATLAB](https://uk.mathworks.com/products/matlab.html?s_tid=hp_products_matlab) - Programing language employed
* [Simulink](https://www.mathworks.com/products/simulink.html) - Environment used to build grids


## Author

* **César Maklary** - *Initial work* - [Simulation of a Smart Grid](FYP_Report.pdf)
