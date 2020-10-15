This example uses the *FinishedBy* statement to start when the *Event* 'finishHelloTransport' is *False*. If the expression in *FinishedBy* evaluates to *True*, the task is internally marked as finished and possible *OnDone* tasks can be started.

```text
Location goodsPallet
    name = "0x4711"
    type = "SmallLoadCarrier"
End

Location warehousePos1
    name = "0x4242"
    type = "SmallLoadCarrier"
End

Event finishHelloTransport
    name = "finishButton"
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
    FinishedBy finishHelloTransport == True
End
```