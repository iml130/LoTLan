# Instances

An *Instance* is the concrete object of a *Primitive*. Such set of *Instances* can be declared by the user and do not share any data other than the definition of their attributes.

## Location

As an example, two *Instances* of *Location* could be initiated out of the *Primitive* *Location* (see [Primitives section](#Primitives)):

```text
Location goodsPallet
    type = "pallet"
    name = "productionArea_palletPlace"
End

Location warehousePos1
    type = "pallet"
    name = "warehouseArea_pos1"
End
```

The *Instance* *goodsPallet* has two member variables, a *type* and a *value*. The *type* attribute states *what item is located there* and the *value* the *logical name of this location*.


## Event

The *Instances* of an *Event* and *Time* *Primitive* could be defined as following:

```text
Event agvLoadedAtGoodsPallet
    type = "Boolean"
    name = "LightBarrier"
End

Event agvLoadedAtWarehousePos1
    type = "Boolean"
    name = "LightBarrier"
End
```

## Time

```text
Time lunchBreak
    timing = "30 12 * * *"  # Cron format
End
```

## Constraint

Constraint:

```text
Constraint costs
    type = "Integer"
End
```
**Syntax**: The syntax of *Primitives* introduced here is complemented by assigning values to the attributes. These values must be enclosed by `"`. The name has to start with a lowercase character. Each attribute also needs to be prefixed with four spaces (or a `\t`).

Speaking of the example introduced in the [introduction](#Logistic-Task-Language), the formerly shown *Location* *Instances* each define a specific location inside the two areas.

![Example instance](/img/instances.png)
*Figure 2: Floor plan with Locations **goodsPallet** and **warehousePos1**

The figure shows those locations inside the two areas *Warehouse* and *Production*.