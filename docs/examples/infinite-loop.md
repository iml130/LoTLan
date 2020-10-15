This program executes the 'helloTransport' task infinitely because it has itself as follow up task in *OnDone*.

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
    OnDone helloTransport
End
```