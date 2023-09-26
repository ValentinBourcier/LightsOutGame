Class {
	#name : #LOPane,
	#superclass : #BorderedMorph,
	#instVars : [
		'cells'
	],
	#category : #LightsOutGame
}

{ #category : #initialization }
LOPane class >> size [
	"The number of cells along each side of the game"
	^ 10
]

{ #category : #'opening/closing' }
LOPane >> close [

	cells do: [ :c | self removeMorph: c. c delete].
	self delete.
]

{ #category : #initialization }
LOPane >> initialize [

	| matrix size button |
	size := self class size.

	super initialize.
	self bounds: (5 @ 5 extent:
			 LOCell size @ LOCell size * size + (2 * self borderWidth)
			 + (0 @ 30)).

	button := SimpleButtonMorph new label: 'Restart'.
	button actionSelector: #restart.
	button target: self.
	button bounds: (6 @ (LOCell size * size + 6) extent: 100 @ 30).
	self addMorph: button.

	matrix := Array2D rows: size columns: size.
	cells := matrix indicesCollect: [ :x :y | self newCellAt: x @ y ]
]

{ #category : #initialization }
LOPane >> newCellAt: aPoint [
	
	"Create a cell for position (i,j) and add it to my on-screen representation at the appropriate
	screen position. Answer the new cell"

	| cell origin |

	origin := self innerBounds origin.

	cell := LOCell new 
		position: (aPoint - 1) * LOCell size + origin;
		mouseAction: [ self toggleCellAt: aPoint ]; 
		yourself.
	
	self addMorph: cell.

	^ cell
]

{ #category : #'opening/closing' }
LOPane >> reset [

	cells do: [ :c | c turnOff ]
]

{ #category : #actions }
LOPane >> restart [

	LightsOutGame
		close;
		reset;
		open
]

{ #category : #'game logic' }
LOPane >> toggleCell: aCell [

	aCell switch: aCell color
]

{ #category : #'game logic' }
LOPane >> toggleCellAt: aPoint [

	| x y size |

	x := aPoint x.
	y := aPoint y.
	size := self class size.
	
	x > 1 ifTrue: [ self toggleCell: (cells at: x - 1 at: y) ].
	y > 1 ifTrue: [ self toggleCell: (cells at: x at: y - 1) ].

	x < size ifTrue: [ self toggleCell: (cells at: x + 1 at: y) ].
	y < size ifTrue: [ self toggleCell: (cells at: x at: y + 1) ].
	
	self toggleCell: (cells at: x at: y)
]
