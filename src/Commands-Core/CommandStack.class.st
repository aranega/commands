Class {
	#name : #CommandStack,
	#superclass : #Stack,
	#instVars : [
		'indexTop'
	],
	#category : #'Commands-Core-core'
}

{ #category : #initialization }
CommandStack >> add: aCommand [
	super add: aCommand.
	indexTop := indexTop + 1.
]

{ #category : #execution }
CommandStack >> execute [

	self do: [ :command | 
		command canExecute ifFalse: [ Exception signal: 'problem' ].
		command execute ]
]

{ #category : #initialization }
CommandStack >> initialize [
	indexTop := 0.
]

{ #category : #execution }
CommandStack >> redo [
	(self at: (indexTop + 1)) redo.
	indexTop := indexTop + 1
]

{ #category : #execution }
CommandStack >> top [

	^ self at: indexTop
]

{ #category : #execution }
CommandStack >> undo [

	indexTop = 0 ifTrue: [ Exception signal: 'Stack is empty' ].
	self top canUndo ifTrue: [ 
		self top undo.
		indexTop := indexTop - 1 ]
]
