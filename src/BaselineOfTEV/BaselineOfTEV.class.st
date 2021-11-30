Class {
	#name : #BaselineOfTEV,
	#superclass : #BaselineOf,
	#category : #BaselineOfTEV
}

{ #category : #baselines }
BaselineOfTEV >> baseline: spec [

	<baseline>
	spec for: #common do: [ 
		spec package: 'TEV' ]
]
