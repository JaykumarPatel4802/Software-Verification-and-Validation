one sig DLL {
	header: lone Node
}
sig Node {
	prev, link: lone Node,
	elem: Int
}

// All nodes should be reachable from the header along the link.
fact Reachable {
	Node = DLL.header.*link
}

// Part A
fact Acyclic {
	// The list has no directed cycle along link, i.e., no node is
	// reachable from itself following one or more traversals along link.-- TODO: Your code starts here.
	all n: Node | n !in n.^link
}

// Part B
pred UniqueElem() {
	// Unique nodes contain unique elements.-- TODO: Your code starts here.
	all n: Node | n.elem !in (Node - n).elem
}

// Part C
pred Sorted() {
	// The list is sorted in ascending order (<=) along link.-- TODO: Your code starts here.
	all n: Node | n.link = none or n.elem <= n.link.elem
}

// Part D
pred ConsistentLinkAndPrev() {
 // For any node n1 and n2, if n1.link = n2, then n2.prev = n1; and vice versa.-- TODO: Your code starts here.
	all n: Node | (n.link = none or (n.link.prev = n)) and (n.prev = none or (n.prev.link = n))
}

run ConsistentLinkAndPrev
