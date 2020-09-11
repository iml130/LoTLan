Location pickupItem
    name = "s1_pickup"
    type = "SmallLoadCarrier"
End

Location dropoffItem
    name = "ws1_dropoff"
    type = "SmallLoadCarrier"
End

Event triggerGetNewMaterial
    name = "virtualSensorNewMaterialToWs1"
    type = "Boolean"
End

Event triggerGetNewMaterial2
    name = "virtualSensorNewMaterialToWs2"
    type = "Boolean"
End


TransportOrderStep loadStorage
    Location pickupItem  # Only one Location can be defined!
End

TransportOrderStep unloadWorkstation1
    Location dropoffItem
End

Task helloTask
    TriggeredBy triggerGetNewMaterial == True
    Transport
    From loadStorage
    To unloadWorkstation1
End