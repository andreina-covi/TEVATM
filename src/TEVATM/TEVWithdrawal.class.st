Class {
	#name : #TEVWithdrawal,
	#superclass : #TEVOperations,
	#instVars : [
		'amountToWithdraw'
	],
	#category : #TEVATM
}

{ #category : #'instance creation' }
TEVWithdrawal class >> new: number [ 
	^ self new amountToWithdraw: number
]

{ #category : #accessing }
TEVWithdrawal >> amountToWithdraw [
	^ amountToWithdraw
]

{ #category : #accessing }
TEVWithdrawal >> amountToWithdraw: anObject [
	amountToWithdraw := anObject
]

{ #category : #initialization }
TEVWithdrawal >> initialize [ 
	super initialize.
	amountToWithdraw := 0
]

{ #category : #running }
TEVWithdrawal >> run: account [

	(amountToWithdraw <= account balance and: [ 
		 amountToWithdraw \\ 10 == 0 ]) ifTrue: [ 
		account withdraw: amountToWithdraw ]
]
