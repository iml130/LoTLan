## Comments

A comment starts with a hash character (`#`) that is not part of a string literal, and ends at the end of the physical line. That means a comment can appear on its own or at the end of a statement. In-line comments are not supported.

This example shows a mimicked multi-line comment that consists of three `#` that are joined together:

```text
###
# This task shows the usage of comments in LoTLan
###
Task transportPalletTask
    # Comment inside a task
    Transport
    From        loadGoodsPallet  # A pallet
    To          unloadGoodsPallet
    TriggeredBy buttonPallet == True  # More comments
    OnDone      refill
    Repeat      5  # Repeat it 5 times!
End
```