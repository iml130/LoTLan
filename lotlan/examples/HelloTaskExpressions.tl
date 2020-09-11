Location pickupItem
    name = "s1_pickup"
    type = "SmallLoadCarrier"
End

Event event
    name = "event"
    type = "Boolean"
End

Event event2
    name = "event2"
    type = "Integer"
End

Time time
    timing = "30 12 * * *"
End

TransportOrderStep loadStorage
    Location pickupItem
    TriggeredBy time
    FinishedBy event2 >= 5
End

TransportOrderStep unloadWorkstation1
    Location pickupItem
    TriggeredBy event
    FinishedBy !event
End

TransportOrderStep binOpTest
    Location pickupItem
    TriggeredBy (event == True) and (event2 == True)
End