Class {
	#name : #LightsOutGame,
	#superclass : #Object,
	#classInstVars : [
		'pane'
	],
	#category : #LightsOutGame
}

{ #category : #'instance creation' }
LightsOutGame class >> close [

	<example>
	pane ifNil: [ self error: 'Lights-out game not initialized.'].
	pane close.
	pane := nil.
]

{ #category : #'instance creation' }
LightsOutGame class >> open [

	<example>
	pane := pane ifNil: [ pane := LOPane new ].
	pane openInWorld
]

{ #category : #initialization }
LightsOutGame class >> reset [
	
	<example>
	pane reset.
]
