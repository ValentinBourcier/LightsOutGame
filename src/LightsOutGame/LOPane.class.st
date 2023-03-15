Class {
	#name : #LOPane,
	#superclass : #BorderedMorph,
	#instVars : [
		'cells'
	],
	#category : #LightsOutGame
}

{ #category : #'opening/closing' }
LOPane >> close [

	cells do: [ :c | self removeMorph: c. c delete].
	self delete.
]

{ #category : #initialization }
LOPane >> initialize [
	
	| matrix |
	
	super initialize.
	matrix := Array2D rows: self size columns: self size.
	
	self bounds: (
		5 @ 5 extent: LOCell size @ LOCell size * self size + (2 * self borderWidth)
	).
	
	cells := matrix indicesCollect: [ :i :j | self newCellAt: i at: j ].
	
]

{ #category : #initialization }
LOPane >> newCellAt: i at: j [
	
	"Create a cell for position (i,j) and add it to my on-screen representation at the appropriate
	screen position. Answer the new cell"

	| cell origin |

	origin := self innerBounds origin.

	cell := LOCell new.
	cell position: ((i - 1) * cell width) @ ((j - 1) * cell height) + origin.
	cell mouseAction: [ self toggleCellAt: i @ j ].
	self addMorph: cell.

	^ cell
]

{ #category : #'opening/closing' }
LOPane >> reset [

	cells do: [ :c | c turnOff ]
]

{ #category : #initialization }
LOPane >> size [
	"The number of cells along each side of the game"
	^ 10
]

{ #category : #'game logic' }
LOPane >> toggleCell: aCell [

	aCell switch: aCell color
]

{ #category : #'game logic' }
LOPane >> toggleCellAt: aPoint [

	| x y |

	x := aPoint x.
	y := aPoint y.
	
	x > 1 ifTrue: [ self toggleCell: (cells at: x - 1 at: y) ].
	y > 1 ifTrue: [ self toggleCell: (cells at: x at: y - 1) ].

	x < self size ifTrue: [ self toggleCell: (cells at: x + 1 at: y) ].
	y < self size ifTrue: [ self toggleCell: (cells at: x at: y + 1) ].
	
	self toggleCell: (cells at: x at: y)
]
