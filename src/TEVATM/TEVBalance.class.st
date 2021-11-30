Class {
	#name : #TEVBalance,
	#superclass : #TEVOperations,
	#instVars : [
		'balance'
	],
	#category : #TEVATM
}

{ #category : #accessing }
TEVBalance >> balance [ 
	^ balance
]

{ #category : #running }
TEVBalance >> run: account [

	balance := account balance
]
