Class {
	#name : #TEVAccount,
	#superclass : #Object,
	#instVars : [
		'balance',
		'pin'
	],
	#category : #'TEV-ATM'
}

{ #category : #comparing }
TEVAccount >> = otherAccount [
	^ otherAccount class == self class and: [ otherAccount pin = pin and: [ otherAccount balance = balance ] ]
]

{ #category : #accessing }
TEVAccount >> balance [

	^ balance
]

{ #category : #accessing }
TEVAccount >> balance: anObject [

	balance := anObject
]

{ #category : #'as yet unclassified' }
TEVAccount >> deposit: number [

	balance := balance + number
]

{ #category : #comparing }
TEVAccount >> hash [ 
	^ balance hash bitXor: pin hash
]

{ #category : #initialization }
TEVAccount >> initialize [

	balance := 0.0
]

{ #category : #accessing }
TEVAccount >> pin [ 
	^ pin
]

{ #category : #accessing }
TEVAccount >> pin: anObject [

	pin := anObject
]

{ #category : #'as yet unclassified' }
TEVAccount >> withdraw: number [
	balance := balance - number
]
