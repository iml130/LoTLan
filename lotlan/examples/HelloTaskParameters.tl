Location pickupItem
    name = "s1_pickup"
    type = "SmallLoadCarrier"
End

Location dropoffItem
    name = "ws1_dropoff"
    type = "SmallLoadCarrier"
End

TransportOrderStep loadStorage
    Location pickupItem
    Parameters liftHeight, unloadDirection
End

TransportOrderStep unloadWorkstation1
    Location dropoffItem
    Parameters unloadDirection
End

Task helloTask
    Transport
    From loadStorage "right", 10
    To unloadWorkstation1 "left"
End