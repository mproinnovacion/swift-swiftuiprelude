#  EdgeInsets Utils

Utilities for EdgeInsets that should have been provided by Apple.

## Constructors

Several constructors to obtain EdgeInsets values.

### init(vertical:horizontal:)

Same values for leading & trailing, and the same for top & bottom.

### init(_:)

Same values in all edges.

### top(_:), bottom(_:), leading(_:), trailing(_:)

Construct the specified edge with the value passed, the rest will be 0.

## Modifiers

### onlyVertical, onlyHorizontal

Keep values > 0 only for one axis.

### top(_:), bottom(_:), leading(_:), trailing(_:)

Get a copy with the specified edge set to the passed value.

## Getters

## width, height

Get the sum of the insets in the specified axis.

## size

Get a CGSize from the insets.

## Operators

### +, -

Add or subtract EdgeInsets.

