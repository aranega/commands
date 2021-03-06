Class {
	#name : #SetCommandTest,
	#superclass : #TestCase,
	#category : #'Commands-tests'
}

{ #category : #tests }
SetCommandTest >> testSetNil [

	| obj setcmd |
	obj := RBVariableNode new.
	obj name: #myname.

	setcmd := SetCommand new
		          object: obj;
		          slotName: #name;
		          value: nil.

	self assert: setcmd canExecute equals: true.

	setcmd execute.
	self assert: obj name equals: nil.

	setcmd undo.
	self assert: obj name equals: #myname
]

{ #category : #tests }
SetCommandTest >> testSetSimpleFameInstanceAttribute [

	| obj setcmd school |
	obj := FamixTest4Teacher new.
	school := FamixTest4School new.
	setcmd := FameSetCommand new
		          object: obj;
		          slotName: #school;
		          value: school.

	self assert: setcmd canExecute equals: true.

	setcmd execute.

	self assert: obj school equals: school.

	self assert: setcmd canUndo equals: true.
	setcmd undo.
	self assert: obj school equals: nil.
	setcmd redo.
	self assert: obj school equals: school
]

{ #category : #tests }
SetCommandTest >> testSetSimpleIntegerValue [

	| obj setcmd |
	obj := RBVariableNode new.

	setcmd := SetCommand new
		          object: obj;
		          slotName: #start;
		          value: 44.

	self assert: setcmd canExecute equals: true.
	
	setcmd execute.
	self assert: obj start equals: 44.
]

{ #category : #tests }
SetCommandTest >> testSetSimpleValue [

	| obj setcmd |
	obj := RBVariableNode new.

	setcmd := SetCommand new
		          object: obj;
		          slotName: #name;
		          value: #myname.

	self assert: setcmd canExecute equals: true.

	setcmd execute.
	self assert: obj name equals: #myname
]

{ #category : #tests }
SetCommandTest >> testSetSimpleValueUndo [

	| obj setcmd previousName |
	obj := RBVariableNode new.

	setcmd := SetCommand new
		          object: obj;
		          slotName: #name;
		          value: #myname.

	self assert: setcmd canExecute equals: true.

	previousName := obj name.
	setcmd execute.
	self assert: obj name equals: #myname.
	self assert: setcmd canUndo equals: true.

	setcmd undo.
	self assert: obj name equals: previousName
]

{ #category : #tests }
SetCommandTest >> testSetSimpleValueUndoRedo [

	| obj setcmd previousName |
	obj := RBVariableNode new.

	setcmd := SetCommand new
		          object: obj;
		          slotName: #name;
		          value: #myname.

	self assert: setcmd canExecute equals: true.

	previousName := obj name.
	setcmd execute.
	self assert: obj name equals: #myname.
	self assert: setcmd canUndo equals: true.

	setcmd undo.
	self assert: obj name equals: previousName.
	
	setcmd redo.
	self assert: obj name equals: #myname
]

{ #category : #tests }
SetCommandTest >> testSetSimpleValueUndoRedoUndo [

	| obj setcmd previousName |
	obj := RBVariableNode new.

	setcmd := SetCommand new
		          object: obj;
		          slotName: #name;
		          value: #myname.

	self assert: setcmd canExecute equals: true.

	previousName := obj name.
	setcmd execute.
	setcmd undo.
	setcmd redo.
	setcmd undo.
	self assert: obj name equals: previousName
]

{ #category : #tests }
SetCommandTest >> testSetUnknownSlot [

	| obj setcmd |
	obj := RBVariableNode new.

	setcmd := SetCommand new
		          object: obj;
		          slotName: #nonexistingslot;
		          value: 44.

	self assert: setcmd canExecute equals: false
]
