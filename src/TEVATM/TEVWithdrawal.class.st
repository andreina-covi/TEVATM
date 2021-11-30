Class {
	#name : #TEVWithdrawal,
	#superclass : #TEVOperations,
	#instVars : [
		'amountToWithdraw'
	],
	#category : #TEVATM
}

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
