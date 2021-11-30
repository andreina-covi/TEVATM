Class {
	#name : #TEVATM,
	#superclass : #Object,
	#instVars : [
		'bank',
		'currentCustomer'
	],
	#category : #TEVATM
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

	^ bank deposit: number given: currentCustomer 
]

{ #category : #'as yet unclassified' }
TEVATM >> functions [
	^ { 'Withdraw'. 'Deposit'. 'Balance inquiry' }
]

{ #category : #'as yet unclassified' }
TEVATM >> getBalanceInquiry [
	^ bank getBalanceInquiry: currentCustomer 
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
			ifFalse: [ bank addTrialsCustomer: customer.
				self error: 'Invalid authentication' ] ]
]

{ #category : #'as yet unclassified' }
TEVATM >> transactions [

	^ bank transactions
]

{ #category : #'as yet unclassified' }
TEVATM >> withdraw: number [

	^ bank withdraw: number given: currentCustomer
]
