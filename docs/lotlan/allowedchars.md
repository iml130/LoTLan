# Set of allowed chars

In the following section we use the terms lower- and uppercase strings definied as followed:

**Lowercase String**: starts with a *lowercase char* and after that you can use every letter, number and the char '_'. *Regular Expression*: ```[a-z][a-zA-Z0-9_]* ```

**Uppercase String**: same as lowercase, except for an *uppercase char* at the beginning. *Regular Expression*: ```[A-Z][a-zA-Z0-9_]*```

## Template

Every *Template* definition starts with a *Template* string. The *Template* name has to be an *uppercase string*.

### Examples

Valid Program:
```text
Template Location
    type = ""
    name = ""
End
```

Invalid Program:
```text
Template Location!!
    type = ""
    name = ""
End

Template Location2
    type = ""
    name = ""
End
```

## Instance

Every *Instance* definition of a *Template* type starts with an *uppercase string* to indicate from which *Template* we want to create an *Instance*. The name of the *Instance* have to be written as *lowercase string*.

### Examples

Valid Program:
```text
Location pickupItem
    name = "s1_pickup"
    type = "SmallLoadCarrier"
End
```

Invalid Program:
```text
Location PickupItem
    name = "s1_pickup"
    type = "SmallLoadCarrier"
End

Location pickup-item
    name = "s1_pickup"
    type = "SmallLoadCarrier"
End
```

## Member Variables
The type has to be *Lowercase string*. The values can either be a *Lowercase* or an *uppercase string* or a sequence of numbers and the chars '*' and '/'. They are always surrounded by " ". 

Regex for value: ``` '"' [a-zA-Z0-9_]+ '"' | '"' ['*'' ''/'0-9]+ '"' | '""' ```

### Examples

Valid Program:
```text
Location pickupItem
    name = "s1_pickup"
    type = "SmallLoadCarrier"
End
```

Invalid Program:
```text
Location pickupItem
    name = s1_pickup
    type = "SmallLoad Carrier"
End

Location pickupItem2
    name = "s1_pickup**"
    type = "SmallLoadCarrier"
End
```

## TransportOrderStep
A *TransportOrderStep* contains the statements *Location* and optionally *Triggered By*,  *Finished By* or *Parameters*.
The *Instance* names should match the corresponding *Instance* so they are *Lowercase strings* too.

With the *OnDone* Keyword you define a follow up *Task* so the task name should match the corresponding *Task* which is an *Lowercase string*. 
*TriggeredBy*, *FinishedBy* use expressions. To learn more about valid expressions goto [this section](#expressions)

*Parameters*:

### Examples

Valid Program:
```text
TransportOrderStep t1
    Location testitest
    TriggeredBy mitarbeiterButtonDasErFertigIst
    FinishedBy abc == (bce < 5)
    OnDone task
End
```

Invalid Program:
```text
TransportOrderStep t1
    MyLocation testitest
    TriggeredBy mitarbeiterButtonDasErFertigIst
    FinishedBy abc == (bce < 5)
    OnDone task
End

TransportOrderStep t2
    Location Location1
    TriggeredBy mitarbeiterButtonDasErFertigIst
    FinishedBy abc == (bce < 5)
    OnDone test
End
```

## Task
*Transport*, *From* and *To* are fixed Keywords. The names of the locations (*From* and *To*) need to be the same as the corresponding locations so they are *Uppercase strings*.
There are the same optional statements as in TransportOrderStep (TriggeredBy, ...)

### Examples

Valid Program:
```text
Task transport_Task
    Transport 
    From        t1
    To          warehouse
    TriggeredBy palette_1Full == TRUE
End
```

Invalid Program:
```text
Task transport_Task
    Transport 
    TriggeredBy palette_1Full == TRUE
    From        t1
    To          warehouse
End

Task transport_Task2
    Transport 
    To          warehouse
    From        t1  
End

Task transport_Task3
    Transport 
    From        t1
    To          warehouse
End
```

## Conditional Expressions

An expression can be definied in multiple ways: 


* As an single attribute
* As a set of nested expressions (have to be surrounded by a left and right parenthesis)
* As a comparison of two expressions with a binary operation 
* As a single expression with an unary operation
* As a condition statement (e.g *True*, *False*, but also integers and floats)

**Regex**:

* Attribute: ``` [a-z][a-zA-Z0-9_]+ ```
* Binary Operation: ```['<''>''<=''>=''and''or''==''=']```
* Unary Operation: ```!```
* Condition Statements: ``` ['True''False''TRUE''FALSE''[0-9]+''[0-9]+( '.' [0-9]+)'] ```


### Examples

Now, we present you some valid examples how to utilize the expressions:

```text
Task transport_Task
    TriggeredBy	palette_3Full == True or 42.42 <= 42.31
    FinishedBy	palette_2Full == FALSE and 40 > 30
End
```


## Indentations

If you are in a block (*Template*, *Instance*, *Task* or *TransportOrderStep*) you need to add an *Indentation* after each newline of a statement. An *Indentation* can be a tabulator or 3 space characters. It is also not allowed to add an *Indentation* before a blockstart it must be the first word after a newline.

Regex: ```('    ' | '\t')```

### Examples

Valid Program:
```text
Location pickupItem
    name = "s1_pickup"
    type = "SmallLoadCarrier"
End
```

Invalid Program:
```text
Location pickupItem
                    name = "s1_pickup"
        type = "SmallLoadCarrier"
End

    Location pickupItem2
    name = "s1_pickup"
    type = "SmallLoadCarrier"
End
```