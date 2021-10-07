Class {
	#name : #VirtualObjectExample2,
	#superclass : #Object,
	#instVars : [
		'a',
		'myprop'
	],
	#category : #'Commands-virtuals'
}

{ #category : #accessing }
VirtualObjectExample2 >> a [
	^ a
]

{ #category : #accessing }
VirtualObjectExample2 >> a: another [
	a := another
]

{ #category : #accessing }
VirtualObjectExample2 >> myprop [
	^ myprop
]

{ #category : #accessing }
VirtualObjectExample2 >> myprop: aVal [

	myprop := aVal
]
