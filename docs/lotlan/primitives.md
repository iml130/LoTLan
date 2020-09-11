# Primitives


A *Primitive* summarizes and specifies a set of *Instances*. All *Instances* have the same member variables as their corresponding *Primitive*. *Primitives* do not need to be clared explicitly. The can be used out of the box. Currently there are 4 *Primitves* implemented:

* Location
* Event
* Time 
* Constraint

## Location

A transport is a movement of goods placed in a container (or bin) from one location to another location. Therefor we define a *Location* with two attributes as following:

```text
Template Location
    type = ""
    name = ""
End
```
The attribute *type* represents the container (or bin) type placed on the location. The location self is named in the field *name*. These attributes can be later accessed inside the instances. 


```text
Location pickUpLocation
    type = "Pallet"
    name = "warehouse_pos1"
End
```
 

## Event

Sometimes it is necessary to determine the flow control, for example when something depends on an interaction with an user action or a physiscal sensor. Therefore we introduce an *Event*, which can described as follows:

```text
Template Event
    name = ""
    type = ""
End
```
An *Event*, has the same attributes as *Location*, a *name* and a *type*. The *type* reprents the datatype, e.g. string, numeric value (Integer, Float) or just a boolean value (True/ False).



## Time

```text
Template Time
    timing = ""
End
```

## Constraint
```text
Template Constraint
    type = ""
End
```

*Event* and *Time* instances can be used in TriggeredBy or FinisheredBy statements.

And finally the Constraint Primitive:


*Constraint* instances can be used in Tasks


Currently only the following 4 primitives are defined: `name`, `type`, `timing`, `constraint`