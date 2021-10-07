Extension { #name : #Collection }

{ #category : #'*Commands' }
Collection >> add: newObject afterIndex: anIndex [
	self subclassResponsibility
]

{ #category : #'*Commands' }
Collection >> removeIndex: removedIndex [
	self subclassResponsibility 
]
