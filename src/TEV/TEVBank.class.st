Class {
	#name : #TEVBank,
	#superclass : #Object,
	#instVars : [
		'data',
		'blockedCustomers',
		'dataTrials'
	],
	#category : #'TEV-ATM'
}

{ #category : #adding }
TEVBank >> addNewCustomer: customer and: account [

	self assert: customer class = TEVCustomer.
	self assert: account class = TEVAccount.
	data
		at: customer
		ifPresent: [ :cust | self error: 'The customer already exists' ]
		ifAbsent: [ data at: customer put: account ]
]

{ #category : #adding }
TEVBank >> addTrialsCustomer: customer [

	dataTrials
		at: customer
		ifPresent: [ :numTrials | 
		dataTrials at: customer put: numTrials + 1 ]
		ifAbsentPut: [ 1 ].
	(dataTrials at: customer) > 3 ifTrue: [ blockedCustomers add: customer ]
]

{ #category : #accessing }
TEVBank >> data [

	^ data
]

{ #category : #accessing }
TEVBank >> data: anObject [

	data := anObject
]

{ #category : #'as yet unclassified' }
TEVBank >> deposit: number given: customer [

	data
		at: customer
		ifPresent: [ :account | (TEVDeposit new: number) run: account ]
		ifAbsent: [ self error: 'Invalid customer' ]
]

{ #category : #'as yet unclassified' }
TEVBank >> getBalanceInquiry: customer [

	^ data
		  at: customer
		  ifPresent: [ :account | TEVBalance new run: account; balance ]
		  ifAbsent: [ self error: 'Invalid customer' ]
]

{ #category : #initialization }
TEVBank >> initialize [

	data := Dictionary new.
	blockedCustomers := OrderedCollection new.
	dataTrials := Dictionary new
]

{ #category : #testing }
TEVBank >> isBlockedCustomer: customer [

	^ blockedCustomers
		  detect: [ :savedCustomer | savedCustomer = customer ]
		  ifFound: [ true ]
		  ifNone: [ false ]
]

{ #category : #removing }
TEVBank >> removeBlockedCustomer: customer [
	| index |
	index := blockedCustomers indexOf: customer.
	index > 0 ifTrue: [ 
		blockedCustomers removeAt: index
		 ]
]

{ #category : #'as yet unclassified' }
TEVBank >> transactions [ 
	^ { 'Withdraw'. 'Deposit'. 'Balance inquiry' }
]

{ #category : #'as yet unclassified' }
TEVBank >> verify: customer givenPIN: number [

	^ data associations
		  detect: [ :assoc | assoc key = customer ]
		  ifFound: [ :assoc | assoc value pin == number ]
		  ifNone: [ false ]
]

{ #category : #'as yet unclassified' }
TEVBank >> withdraw: number given: customer [

	data
		at: customer
		ifPresent: [ :account | (TEVWithdrawal new: number) run: account ]
		ifAbsent: [ self error: 'Invalid customer' ]
]
