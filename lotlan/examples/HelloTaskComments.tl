# begin of program

# this defines the location pickupItem
Location pickupItem #block starts
    name = "s1_pickup"
    type = "SmallLoadCarrier"
End

# this defines a location
Location dropoffItem
    name = "ws1_dropoff"
    type = "SmallLoadCarrier"
End

######
## Multiline comments with multiple #
#######
TransportOrderStep loadStorage
    Location pickupItem  # Only one Location can be defined!
End

TransportOrderStep unloadWorkstation1
    Location dropoffItem
    #Comment before statement: TriggeredBy event
End

Task helloTask
    Transport #transport
    From loadStorage #from
    To unloadWorkstation1 #to

    # on done
    OnDone helloTask
End #end of program