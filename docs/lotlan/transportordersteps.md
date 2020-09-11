## TransportOrderSteps

A *TransportOrderStep* is a *Task*-fragment that contains only a Location and optionally a *TriggeredBy*, *FinishedB*y, *OnDone* or *Parameters* statement. It can be used by a *Task* as a from/to value.

```text
TransportOrderStep {name}
    Location {location_0}
    TriggeredBy {none|event|time}
    OnDone      {none|followUpTask}
    FinishedBy  {none|event|time}
    Parameters  { param1, param2, ...}
End
```

As an example, two *TransportOrderSteps* are created, both describing a short process:

```text
TransportOrderStep loadGoodsPallet
    Location    goodsPallet
    FinishedBy  agvLoadedAtGoodsPallet == True
    Parameters  liftHeight, unloadDirection
End

TransportOrderStep unloadGoodsPallet
    Location    warehousePos1
    FinishedBy  agvLoadedAtWarehousePos1 == False
    Parameters  unloadDirection
End
```

The *TransportOrderStep* *loadGoodsPallet* defines picking up from the *Location* *goodsPallet*, which is finished when the *Event* *agvLoadedAtGoodsPallet* is True. In the task the user can specify the liftHeight and the unloadDirection at the location. A possible situation could be two storage racks with different layers on different heights. The Task passes over the height and whether the charge should be unloaded left or right.

For the the optional statements TriggeredBy, FinishedBy and OnDone see [Tasks section](#Tasks).

**Syntax**: It is important that the values inside an *TransportOrderStep - End* definition begin with a uppercase character. Each value also needs to be prefixed with four spaces (or a `\t`). The name has to start with an lowercase character. Currently only the following 5 attributes are allowed: `Location`, `TriggeredBy`, `FinishedBy`, `OnDone`, `Parameters`