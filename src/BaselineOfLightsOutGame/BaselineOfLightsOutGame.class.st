Class {
	#name : #BaselineOfLightsOutGame,
	#superclass : #BaselineOf,
	#category : #BaselineOfLightsOutGame
}

{ #category : #baselines }
BaselineOfLightsOutGame >> baseline: spec [

	<baseline>
	spec for: #common do: [ spec package: 'LightsOutGame' ]
]
