In this example we introduce two events which represents two buttons to realize manual loading and unloading. The idea is that if a worker is done with the loading/ unloading operation, it must be acknolwedged manually by pressing a button. A manual loading/ unloading operation might be needed if an AGV is not able to perform this operation automatically.

This buttonPressed event, represented by  *agvLoadedAtGoodsPallet* and *agvLoadedAtWarehousePos1*, is used in the respective *FinishedBy* statements of the corresponding *TransportOrderSteps*. If a *TransportOrderStep* is executed it can only be finished if the condition in *FinishedBy* evaluates to *True*.

```text
Location goodsPallet
    name = "0x4711"
    type = "SmallLoadCarrier"
End

Location warehousePos1
    name = "0x4242"
    type = "SmallLoadCarrier"
End

Event agvLoadedAtGoodsPallet
    name = "agvLoaded1"
    type = "Boolean"
End

Event agvLoadedAtWarehousePos1
    name = "agvLoaded2"
    type = "Boolean"
End

TransportOrderStep loadGoodsPallet
    Location goodsPallet
    FinishedBy agvLoadedAtGoodsPallet == True
End

TransportOrderStep unloadGoodsPallet
    Location warehousePos1
    FinishedBy agvLoadedAtWarehousePos1 == True
End

Task helloTransport
    Transport
    From loadGoodsPallet
    To unloadGoodsPallet
End
```