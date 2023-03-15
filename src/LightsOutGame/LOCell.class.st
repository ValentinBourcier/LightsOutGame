"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

LightsOut Cell

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	mouseAction:		<Object>


    Implementation Points
"
Class {
	#name : #LOCell,
	#superclass : #SimpleSwitchMorph,
	#instVars : [
		'mouseAction'
	],
	#category : #LightsOutGame
}

{ #category : #accessing }
LOCell class >> size [ 

	^ 50
]

{ #category : #initialization }
LOCell >> initialize [
	super initialize.

	self label: ''.
	self borderWidth: 2.
	self useSquareCorners.
	bounds := 0 @ 0 corner: 50 @ 50.

	offColor := (Color r: 210/255 g: 210/255 b: 210/255).
	onColor := (Color r: 1.0 g: 215/255 b: 0.0).
	self turnOff
]

{ #category : #'event handling' }
LOCell >> mouseAction: aBlock [

	^ mouseAction := aBlock
]

{ #category : #'event handling' }
LOCell >> mouseMove: anEvent [

	"No action"
]

{ #category : #'event handling' }
LOCell >> mouseUp: anEvent [

	mouseAction value
]

{ #category : #accessing }
LOCell >> switch: aColor [

	self setSwitchState: aColor = offColor
]
