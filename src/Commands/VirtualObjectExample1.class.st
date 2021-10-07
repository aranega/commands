Class {
	#name : #VirtualObjectExample1,
	#superclass : #Object,
	#instVars : [
		'b',
		'name'
	],
	#category : #'Commands-virtuals'
}

{ #category : #accessing }
VirtualObjectExample1 >> b [
	^ b
]

{ #category : #accessing }
VirtualObjectExample1 >> b: anotherObject [
	b := anotherObject 
]

{ #category : #accessing }
VirtualObjectExample1 >> name [
	^ name
]

{ #category : #accessing }
VirtualObjectExample1 >> name: aName [
	name := aName
]
