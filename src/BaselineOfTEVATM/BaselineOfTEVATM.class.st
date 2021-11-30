Class {
	#name : #BaselineOfTEVATM,
	#superclass : #BaselineOf,
	#category : #BaselineOfTEVATM
}

{ #category : #baselines }
BaselineOfTEVATM >> baseline: spec [

	<baseline>
	spec for: #common do: [ 
		spec package: 'TEVATM' ]
]
