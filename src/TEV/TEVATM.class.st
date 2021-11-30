Class {
	#name : #TEVATM,
	#superclass : #Object,
	#instVars : [
		'bank',
		'currentCustomer'
	],
	#category : #'TEV-ATM'
}

{ #category : #'instance creation' }
TEVATM class >> new: bank [
	^ self new 
		bank: bank
]

{ #category : #accessing }
TEVATM >> bank [

	^ bank
]

{ #category : #accessing }
TEVATM >> bank: anObject [

	bank := anObject
]

{ #category : #'as yet unclassified' }
TEVATM >> deposit: number [

	currentCustomer 
		ifNotNil: [ bank deposit: number given: currentCustomer ]
]

{ #category : #'as yet unclassified' }
TEVATM >> getBalanceInquiry [
	^ currentCustomer 
		ifNil: [ -1 ] 
		ifNotNil: [ bank getBalanceInquiry: currentCustomer ]
]

{ #category : #initialization }
TEVATM >> initialize [ 
	bank := TEVBank new
]

{ #category : #'as yet unclassified' }
TEVATM >> start: customer givenPIN: number [

	currentCustomer := nil.
	(bank isBlockedCustomer: customer) ifFalse: [ 
		(bank verify: customer givenPIN: number)
			ifTrue: [ currentCustomer := customer ]
			ifFalse: [ bank addTrialsCustomer: customer ] ]
]

{ #category : #'as yet unclassified' }
TEVATM >> transactions [

	^ bank transactions
]

{ #category : #'as yet unclassified' }
TEVATM >> withdraw: number [
	currentCustomer
		ifNotNil: [ bank withdraw: number given: currentCustomer ]
]
