
Location pickupItem



    name = "s1_pickup"


    type = "SmallLoadCarrier"
End






Location dropoffItem
    name = "ws1_dropoff"

    type = "SmallLoadCarrier"
End

Event event
    name = "event1"
    type = "Integer"
End

TransportOrderStep loadStorage
    Location pickupItem 
End
TransportOrderStep unloadWorkstation1
    Location dropoffItem


    OnDone helloTask


    TriggeredBy event == 5






End




Task helloTask
    Transport
    From loadStorage
    To unloadWorkstation1
    TriggeredBy event == 5

    
    OnDone task2


End

Task task2
    TriggeredBy event == 5
End