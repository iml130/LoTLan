Location pickupItem
    name = "s1_pickup"
    type = "SmallLoadCarrier"
End

Location dropoffItem
    name = "ws1_dropoff"
    type = "SmallLoadCarrier"
End


TransportOrderStep loadStorage
    Location pickupItem  # Only one Location can be defined!
End

TransportOrderStep unloadWorkstation1
    Location dropoffItem
End

Task helloTask
    Transport
    From loadStorage
    To unloadWorkstation1
    OnDone helloTask
End

Task helloTask2
    OnDone helloTask
End

Task helloTask3
    OnDone helloTask4
End

Task helloTask4
    OnDone helloTask4
End

Task helloTask5
    OnDone helloTask
End
