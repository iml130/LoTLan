In this example you can see how you would use multiple operators together to create more complex statements than in the previous examples.

You can expect familiar syntax rules as in popular programing languages for all boolean expressions that can be used in the task language. The available boolean operators are *and*, *or* and *not*, with '!' representing the latter.

We also have operator *precedence*: ** ! > and > or **. If you want for example two events connected with *or* evaluated before connecting with an *and* use parentheses as in 'helloTransportParentheses'.

If you just type goodsPalletFull without '==' it evaluates it internally to:

```text
    goodsPalletFull == True
```

The counterpart is !goodsPalletFull which evaluates to:

```text
    goodsPalletFull == False
```

As well as many other programing languages we do not have an additional operator for xor so you have to use the complete set {!, and, or} to realize it.

```text
Location goodsPallet
    name = "0x4711"
    type = "SmallLoadCarrier"
End

Location warehousePos1
    name = "0x4242"
    type = "SmallLoadCarrier"
End

Event startHelloTransport
    name = "startButton"
    type = "Boolean"
End

Event goodsPalletFull
    name = "palletFull"
    type = "Boolean"
End

Event condition3
    name = "condition"
    type = "Boolean"
End

TransportOrderStep loadGoodsPallet
    Location goodsPallet
End

TransportOrderStep unloadGoodsPallet
    Location warehousePos1
End

Task helloTransportOr
    TriggeredBy startHelloTransport or goodsPalletFull
    Transport
    From loadGoodsPallet
    To unloadGoodsPallet
End

Task helloTransportAnd
    TriggeredBy startHelloTransport and goodsPalletFull
    Transport
    From loadGoodsPallet
    To unloadGoodsPallet
End

Task helloTransportXor
    TriggeredBy !startHelloTransport and goodsPalletFull or startHelloTransport and !goodsPalletFull
    Transport
    From loadGoodsPallet
    To unloadGoodsPallet
End

Task helloTransportParentheses
    TriggeredBy (startHelloTransport or goodsPalletFull) and condition3
    Transport
    From loadGoodsPallet
    To unloadGoodsPallet
End
```

