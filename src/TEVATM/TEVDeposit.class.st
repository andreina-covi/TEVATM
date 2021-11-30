Class {
	#name : #TEVDeposit,
	#superclass : #TEVOperations,
	#instVars : [
		'amountToDeposit'
	],
	#category : #TEVATM
}

{ #category : #'instance creation' }
TEVDeposit class >> new: number [ 	
	^ self new amountToDeposit: number
]

{ #category : #accessing }
TEVDeposit >> amountToDeposit [
	^ amountToDeposit
]

{ #category : #accessing }
TEVDeposit >> amountToDeposit: anObject [
	amountToDeposit := anObject
]

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
