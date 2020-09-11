# Constraints

In this example we define a constraint in task 'helloTransport'. *Constraints* can be used for example in scheduling to have an additional variable which flows into optimization. In this example the cost of a transport, e.g. by an AGV, needs to be less equal than 100.

```text
Location goodsPallet
    name = "0x4711"
    type = "SmallLoadCarrier"
End

Location warehousePos1
    name = "0x4242"
    type = "SmallLoadCarrier"
End

Constraint costs
    type = "Integer"
End

TransportOrderStep loadGoodsPallet
    Location goodsPallet
End

TransportOrderStep unloadGoodsPallet
    Location warehousePos1
End

Task helloTransport
    Transport
    From loadGoodsPallet
    To unloadGoodsPallet
    Constraints costs <= 100
End
```