Class {
	#name : #TEVDeposit,
	#superclass : #TEVOperations,
	#instVars : [
		'amountToDeposit'
	],
	#category : #TEVATM
}

{ #category : #initialization }
TEVDeposit >> initialize [ 
	super initialize.
	amountToDeposit := 0
]

{ #category : #running }
TEVDeposit >> run: account [

	(amountToDeposit > 0 and: [ amountToDeposit \\ 10 == 0 ]) ifTrue: [ 
		account deposit: amountToDeposit ]
]
