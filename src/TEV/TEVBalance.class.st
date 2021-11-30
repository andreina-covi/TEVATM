Class {
	#name : #TEVBalance,
	#superclass : #TEVOperations,
	#instVars : [
		'balance'
	],
	#category : #'TEV-ATM'
}

{ #category : #accessing }
TEVBalance >> balance [ 
	^ balance
]

{ #category : #running }
TEVBalance >> run: account [

	balance := account balance
]
