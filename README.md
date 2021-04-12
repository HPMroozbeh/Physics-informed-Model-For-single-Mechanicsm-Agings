# A Physics-Informed Multi-Agents Model To Predict Thermo-Oxidative/Hydrolytic Aging of Elastomers

### Reference


### Summary 

In this hybrid framework, the effect of single-mechanism aging, such as thermo-oxidative or hydrolytic aging on the behavior of the material, is represented using the proposed model.  Those environmental single-mechanism damages change the polymer matrix over time due to massive chain scission, reduction of cross-links, chain formations, and changing the polymer morphology.  We propose a data-driven super-constrained machine-learned engine to represent damage in the polymer matrix and capture the changes in material behaviour, including its inelastic features such as Mullins effect and permanent set in the course of aging. We have simplified the 3D stress-strain tensor mapping problem into a small number of super-constrained 1D mapping problems by means of a sequential order reduction.  An assembly of multiple replicated conditional neural-network learning-agents (L-agents) is trained to systematically simplify the high-dimensional mapping problem into multiple 1D problems, each represented by a different type of agent.  Our hybrid framework is designed to capture the effect of deformation history, aging time, and aging temperature.

![Agings Types](https://user-images.githubusercontent.com/81969048/114432819-18955300-9b8f-11eb-80df-d87ed88b6623.png)
