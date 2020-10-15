This example uses the *TriggeredBy* statement to trigger the start of 'helloTransport' when the *Event* 'startHelloTransport' occured, in this case it is *True*.

```text
Location goodsPallet
    name = "0x4711"
    type = "SmallLoadCarrier"
End

Location warehousePos1
    name = "0x4242"
    type = "SmallLoadCarrier"
End

Event startHelloTransport
    name = "startButton"
    type = "Boolean"
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
    TriggeredBy startHelloTransport == True
End
```