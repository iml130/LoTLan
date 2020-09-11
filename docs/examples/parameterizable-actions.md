# Parameterizable-Actions

For this example we have to introduce an new scenario containing storage racks. In each location are two storage racks. The AGV drives between them and has to know its lift height and on which side to perform the load/unload operation. A *TransportOrderStep* can request the required parameters when its called in a task. In 'helloTransport' we pass in the parameter values: If the AGV arrives at location 'storageRack1', it should load goods from the right rack and has to lift it the *StorageRack* up to five meters. Once the AGV is at location 'storageRack2', the AGV should unload it goods on the left rack and lift it up to two meters.

```text
Location storageRack1
    name = "0x4711"
    type = "StorageRack"
End

Location storageRack2
    name = "0x4242"
    type = "StorageRack"
End

TransportOrderStep loadGoodsPallet
    Location storageRack1
    Parameters loadDirection, liftHeight
End

TransportOrderStep unloadGoodsPallet
    Location storageRack2
    Parameters loadDirection, liftHeight
End

Task helloTransport
    Transport
    From loadGoodsPallet "right", 5
    To unloadGoodsPallet "left", 2
End
```

Note: Parameters are completely optional and even if you use them in the 'From' *TransportOrderStrep* its not necessary to use them in the other one.