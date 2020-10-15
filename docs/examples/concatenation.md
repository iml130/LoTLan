This program starts with the 'helloTransport' task and transports from 'goodsPallet' to 'warehousePos1'. Once task 'helloTransport' is finished, the follow up task 'followUpTask' is triggered which starts a transport back from 'warehousePos1' to 'goodsPallet'.

```text
Location goodsPallet
    name = "0x4711"
    type = "SmallLoadCarrier"
End

Location warehousePos1
    name = "0x4242"
    type = "SmallLoadCarrier"
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
    OnDone followUpTask
End

Task followUpTask
    Transport
    From unloadGoodsPallet
    To loadGoodsPallet
End
```