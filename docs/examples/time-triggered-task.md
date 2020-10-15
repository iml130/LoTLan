In this example 'helloTransport' is triggered each morning at 8:30am. Keep in mind that timing has to be given in cron format, a known format in UNIX systems.

```text
Location goodsPallet
    name = "0x4711"
    type = "SmallLoadCarrier"
End

Location warehousePos1
    name = "0x4242"
    type = "SmallLoadCarrier"
End

Time startInTheMorning
    timing = "30 8 * * *"  # Cron format
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
    TriggeredBy startInTheMorning
End
```