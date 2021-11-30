Class {
	#name : #TEVCustomer,
	#superclass : #Object,
	#instVars : [
		'name',
		'id'
	],
	#category : #'TEV-ATM'
}

{ #category : #comparing }
TEVCustomer >> = otherCustomer [
	^ otherCustomer class == self class and: [ id = otherCustomer id ]
]

{ #category : #comparing }
TEVCustomer >> hash [ 
	^ id hash
]

{ #category : #accessing }
TEVCustomer >> id [

	^ id
]

{ #category : #accessing }
TEVCustomer >> id: anObject [

	id := anObject
]

{ #category : #accessing }
TEVCustomer >> name [

	^ name
]

{ #category : #accessing }
TEVCustomer >> name: anObject [

	name := anObject
]
