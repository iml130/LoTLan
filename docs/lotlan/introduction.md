## Introduction

The *LoTLan* consists of 4 different building blocks, that combined with each other describes such a process:

- Primitives
- Instances
- TransportOrderSteps
- Tasks

A *Primitive* is an abstract model for a series of similar objects. It is the blueprint for the representation of real objects in software objects and describes attributes (properties) of the objects. Through the instantiation of such a *Primitive* a *Instance* of a concrete object is created. The *TransportOrderStep* with the help of these *Instances* describes a short procedure. A *Task* then combines *Instances* and *TransportOrderSteps* to a enlarged logical process flow.

### Use of Example

The following documentation of *LoTLan* utilizes the example of a production hall that has an area for storing goods *- the Warehouse -* and an area for the manufacturing *- the Production*. To reduce the complexity only one AGV out of a possible lager fleet is used.

![Example introduction](/img/introduction.png)
*Figure 1: Example floor plan with AGV and production & warehouse area*

This example in the figure above shown will be extended in the course of time to explain the individual building blocks of the *LoTLan*.