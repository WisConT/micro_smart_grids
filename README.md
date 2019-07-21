# micro_smart_grids

Repository with Smart Grid simulation code from MATLAB and Simulink along with a report on the Simulation of a Smart Grid at a microgrid level.

## Getting Started

Before running the validation case or the experimental simulation, it is necessary to load the [default solar panel data file from MATLAB](Simulation/default_PV_data.mat) in the MATLAB workspace. The simulations also require the download of the [Simscape package](https://www.mathworks.com/products/simscape.html).

### Validation case

To run the theoretical validation case, the file [power_microgrid_v3_analytic](Analytic Validation/power_microgrid_v3_analytic.slx) should then be opened in MATLAB Simulink. The output results from the scopes should then be compared to the output of the [FYP_analytical_test script](Analytic Validation/FYP_analytical_test.m).

## Running the tests

Explain how to run the automated tests for this system




## Built With

* [Dropwizard](http://www.dropwizard.io/1.0.2/docs/) - The web framework used
* [Maven](https://maven.apache.org/) - Dependency Management
* [ROME](https://rometools.github.io/rome/) - Used to generate RSS Feeds


## Authors

* **Billie Thompson** - *Initial work* - [PurpleBooth](https://github.com/PurpleBooth)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.
