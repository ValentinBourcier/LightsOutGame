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

	<script: 'self close'>
	pane ifNil: [ self error: 'Lights-out game not initialized.'].
	pane close.
	pane := nil.
]

{ #category : #'instance creation' }
LightsOutGame class >> open [

	<script: 'self open'>
	pane := pane ifNil: [ pane := LOPane new ].
	pane openInWorld
]

{ #category : #initialization }
LightsOutGame class >> reset [

	<script: 'self reset'>
	pane ifNotNil: [ :p | p reset ]
]
