Location pickup
    name = "0x4711"
    type = "SmallLoadCarrier"
End

Location dropoff
    name = "0x4242"
    type = "SmallLoadCarrier"
End

TransportOrderStep loadStorage
    Location pickup
End

TransportOrderStep unloadWorkstation1
    Location dropoff
End

Task helloTransport
    Transport
    From loadStorage
    To unloadWorkstation1
End
