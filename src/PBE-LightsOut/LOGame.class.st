Class {
	#name : #LOGame,
	#superclass : #Object,
	#classInstVars : [
		'pane'
	],
	#category : #'PBE-LightsOut'
}

{ #category : #'instance creation' }
LOGame class >> close [

	pane ifNil: [ self error: 'Lights-out game not initialized.'].
	pane delete.
]

{ #category : #'instance creation' }
LOGame class >> open [

	pane := pane ifNil: [ pane := LOPane new ].
	pane openInWorld
]
